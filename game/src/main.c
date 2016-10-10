//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------
// colores del personaje
// {54      44           4D       5C    40 o 41    4E       4A }
// {negro, azul marino, magenta, marron, gris, naranja, amarillo}
// { 0        1          8        3       13      15        24 }

#include <cpctelera.h>
#include "knifeX.h"
#include "knifeY.h"
#include "hero.h"
#include "enemy.h"
#include "map1.h"
#include "map2.h"
#include "map3.h"
#include "tiles.h"
#include "song.c"

#define  SI 1
#define  NO 0
#define  ORIGEN_MAPA_Y	0
#define  ORIGEN_MAPA  cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y)

#define ANCHO_PANTALLA	g_map1_W * 2  	// 2 bytes por tile
#define ALTO_MAPA g_map1_H * 4 			// 4 bytes por tile

#define LIMITE_IZQUIERDO 0 + 4
#define LIMITE_DERECHO ANCHO_PANTALLA - 4

#define LIMITE_SUPERIOR 0 + 8
#define LIMITE_INFERIOR ALTO_MAPA - 8

#define ALTO_PROTA 22



enum {
      M_derecha   = 0
   ,  M_izquierda
   ,  M_arriba
   ,  M_abajo
} EMirar;

enum {
      E_X   = 0
   ,  E_Y
} EEje;


typedef struct {
	u8  x, y;
	u8  px, py;
	u8* sprite;
	u8  mover;
	u8  mira;
} TProta;

typedef struct {
	u8  x, y;
	u8  px, py;
	u8* sprite;
	u8  mover;
	u8  mira;
} TEnemy;


typedef struct {
	u8  x, y;
	u8  px, py;
	u8* sprite;
	u8 lanzado;
	u8 direccion;
	u8 eje;
} TKnife;

// Mapas
#define NUM_MAPAS 3
u8* const mapas[NUM_MAPAS] = { g_map1, g_map2, g_map3 };


TEnemy enemy;

TProta prota;

TKnife cu[10];


u8* mapa;
u8  num_mapa;


cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
																// Si el modo fuera 1 solo podríamos tener el 0, 1, 2, 3

void dibujarMapa() {
	cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
}



void dibujarProta() {
	u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
	cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
}

void borrarProta() {
	//u8 w = 4 + (prota.px & 1);
	u8 w = 4 + (prota.px & 1);

	//u8 h = 7 + (prota.py & 3 ? 1 : 0);
	u8 h = 6 + (prota.py & 2 ? 1 : 0);

	cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
}



void redibujarProta() {
	borrarProta();
	prota.px = prota.x;
	prota.py = prota.y;
	dibujarProta();
}

u8* getTilePtr(u8 x, u8 y) {
   return mapa + (y/4)*g_map1_W + x/2;
}

u8 checkCollision(int direction) { // check optimization
   u8 *headTile, *feetTile, *waistTile;

   switch (direction) {
    case 0:
        headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
        feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
        waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
        break;
    case 1:
        headTile  = getTilePtr(prota.x - 1, prota.y);
        feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
        waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
        break;
    case 2:
        headTile   = getTilePtr(prota.x, prota.y - 2);
        feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
        *waistTile = 0;
        break;
    case 3:
        headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
        feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
        *waistTile = 0;
        break;
   }

   if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
      return 1;

   return 0;
}


void dibujarEnemigo() {
	u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy.x, enemy.y);
	cpct_drawSpriteMaskedAlignedTable (enemy.sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
}

void borrarEnemigo() {
	//u8 w = 4 + (enemy.px & 1);
	u8 w = 4 + (enemy.px & 1);

	//u8 h = 7 + (enemy.py & 3 ? 1 : 0);
	u8 h = 7 + (enemy.py & 2 ? 1 : 0);

	cpct_etm_drawTileBox2x4 (enemy.px / 2, (enemy.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
}



void redibujarEnemigo() {
	borrarEnemigo();
	enemy.px = enemy.x;
	enemy.py = enemy.y;
	dibujarEnemigo();
}

void moverEnemigo(){

	if(enemy.mira == M_abajo){
		if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
			 && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y + G_ENEMY_H + 2) <= 2
			 	&& *getTilePtr(enemy.x + G_ENEMY_W, enemy.y + G_ENEMY_H + 2) <= 2)
		{
			
			enemy.y++;
			enemy.y++;
			redibujarEnemigo();
		}else{
			enemy.mira = M_arriba;
		}
	}
	else{
		if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
			 && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y - 2) <= 2
			 	&& *getTilePtr(enemy.x + G_ENEMY_W, enemy.y - 2) <= 2)
		{
			
			enemy.y--;
			enemy.y--;
			redibujarEnemigo();
		}else{
			enemy.mira = M_abajo;
		}
	}
}

void avanzarMapa() {
	if(num_mapa < NUM_MAPAS -1) {
		mapa = mapas[++num_mapa];
		enemy.x = prota.px = 2;
		prota.mover = SI;
		dibujarMapa();
	}
	else{
		menuFin();
	}
}

void moverIzquierda() {
	prota.mira = M_izquierda;
  if (!checkCollision(M_izquierda)) {
  		prota.x--;
      prota.mover = SI;
  }
}

void moverDerecha() {
	prota.mira = M_derecha;
	if (!checkCollision(M_derecha)) {
  		prota.x++;
  		prota.mover = SI;
    }else if ( prota.x > 68 && prota.y >72 && prota.y < 80){  //TODO que avance solo si estamos en el centro
		avanzarMapa();
	}
}

void moverArriba() {
	prota.mira = M_arriba;
	if (!checkCollision(M_arriba)) {
  		prota.y--;
  		prota.y--;
  		prota.mover  = SI;
    }
}

void moverAbajo() {
	prota.mira = M_abajo;
	if (!checkCollision(M_abajo)) {
	   prota.y++;
	   prota.y++;
	   prota.mover  = SI;
  }
}

void dibujarCuchillo(TKnife* actual) {
	u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
	if(actual->eje == E_X){
		cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	}

	else if(actual->eje == E_Y){
		cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
	}
}

void borrarCuchillo(TKnife* actual) {
	u8 w = 2 + (actual->px & 1);
	u8 h = 2 + (actual->py & 3 ? 1 : 0);
	cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
}

void redibujarCuchillo(TKnife* actual) {
	borrarCuchillo(actual);
	actual->px = actual->x;
	actual->py = actual->y;
	dibujarCuchillo(actual);
}


void lanzarCuchillo(){

	TKnife* actual = cu;
	u8 i = 10 + 1;
	--i;
	while(i>0 && actual->lanzado){
		--i;
		actual++;
	}

	if(i>0 && !actual->lanzado){

		if(prota.mira == M_derecha){

			if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
				actual->lanzado = SI;
				actual->direccion = M_derecha;
				actual->x=prota.x + G_HERO_W;
				actual->y=prota.y + G_HERO_H /2;
				actual->sprite=g_knifeX_0;
				actual->eje = E_X;
				dibujarCuchillo(actual);
			}
		}
		else if(prota.mira == M_izquierda){
			if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
				actual->lanzado = SI;
				actual->direccion = M_izquierda;
				actual->x = prota.x - G_KNIFEX_0_W;
				actual->y = prota.y + G_HERO_H /2;
				actual->sprite = g_knifeX_1;
				actual->eje = E_X;
				dibujarCuchillo(actual);
			}
		}
		else if(prota.mira == M_abajo){
			u8 valor = LIMITE_INFERIOR;
			if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
				actual->lanzado = SI;
				actual->direccion = M_abajo;
				actual->x = prota.x + G_HERO_W / 2;
				actual->y = prota.y + G_HERO_H;
				actual->sprite = g_knifeY_0;
				actual->eje = E_Y;
				dibujarCuchillo(actual);
			}
		}
		else if(prota.mira == M_arriba){
			if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
				actual->lanzado = SI;
				actual->direccion = M_arriba;
				actual->x = prota.x + G_HERO_W / 2;
				actual->y = prota.y;
				actual->sprite = g_knifeY_1;
				actual->eje = E_Y;
				dibujarCuchillo(actual);
			}
		}
	}
}

void comprobarTeclado() {
	cpct_scanKeyboard_if();

	if (cpct_isAnyKeyPressed()) {
		if (cpct_isKeyPressed(Key_CursorLeft))
			moverIzquierda();
		else if (cpct_isKeyPressed(Key_CursorRight))
			moverDerecha();
		else if (cpct_isKeyPressed(Key_CursorUp))
			moverArriba();
		else if (cpct_isKeyPressed(Key_CursorDown))
			moverAbajo();
		else if (cpct_isKeyPressed(Key_Space))
			lanzarCuchillo();
	}
}



void moverCuchillo(){

	u8 i = 10 + 1;
	TKnife* actual = cu;

	while(--i){
		if(actual->lanzado){
			if(actual->direccion == M_derecha){
				
				if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
					actual->x++;

					redibujarCuchillo(actual);
				}
				else {
					borrarCuchillo(actual);
					actual->lanzado = NO;
				}
			}
			else if(actual->direccion == M_izquierda){
				if(*getTilePtr(actual->x - 1, actual->y) <= 2){
					actual->x--;

					redibujarCuchillo(actual);
				}else{
					borrarCuchillo(actual);
					actual->lanzado = NO;
				}
			}
			else if(actual->direccion == M_abajo){
				if(*getTilePtr(actual->x, actual->y + G_KNIFEY_0_H + 2) <= 2){
					actual->y++;
					actual->y++;
					redibujarCuchillo(actual);


				}else{
					borrarCuchillo(actual);
					actual->lanzado = NO;
				}
			}
			else if(actual->direccion == M_arriba){
				if(*getTilePtr(actual->x, actual->y - 2) <= 2){
					actual->y--;
					actual->y--;
					redibujarCuchillo(actual);

				}else{
					borrarCuchillo(actual);
					actual->lanzado = NO;
				}
			}
		}
		++actual;
	}
}

void menuFin(){
	u8* memptr;
	// borrar pantalla
	cpct_clearScreen(0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   	cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 3);

   	
   	// Esperar hasta pulsar intro 
   	do{
   		cpct_scanKeyboard_f();   		
   	} while(!cpct_isKeyPressed(Key_I));   		
}

void menu(){
	u8* memptr;
	// borrar pantalla
	cpct_clearScreen(0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 10); // centrado en horizontal y arriba en vertical
   	cpct_drawStringM0("MENU", memptr, 2, 3);

   	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // centrado en horizontal y abajo en vertical
   	cpct_drawStringM0("PULSA I", memptr, 1, 0);

   	// Esperar hasta pulsar intro 
   	do{
   		cpct_scanKeyboard_f();   		
   	} while(!cpct_isKeyPressed(Key_I));   		
}


void inicializar() {

	u8 i;
	TKnife* actual = cu;

	cpct_disableFirmware();
	cpct_setVideoMode(0);
	//cpct_setBorder(HW_BLACK);
	cpct_setPalette(g_palette, 16);
	cpct_akp_musicInit(G_song);
	mapa = g_map1;
	num_mapa = 0;
	cpct_etm_setTileset2x4(g_tileset);
	dibujarMapa();


	prota.x = prota.px = 4;
	prota.y = prota.py = 80;
	prota.mover  = NO;
	prota.mira=M_derecha;
	prota.sprite = g_hero;

	enemy.x = enemy.px = 67;
	enemy.y = enemy.py = 84;
	enemy.mover  = NO;
	enemy.mira=M_abajo;
	enemy.sprite = g_enemy;


	i = 10 + 1;


	while(--i){
		actual->x = actual->px = 0;
		actual->y = actual->py = 0;
		actual->lanzado = 0;
		++actual;
	}


	dibujarProta();
	dibujarEnemigo();
}

void main(void) {

	menu();

	inicializar();
   	cpct_akp_musicPlay();


   	while (1) {


   		comprobarTeclado();

		cpct_waitVSYNC();
   		moverCuchillo();
   		moverEnemigo();

   		if (prota.mover) {

   			redibujarProta();
   			prota.mover = NO;
   		}
   	}
}
