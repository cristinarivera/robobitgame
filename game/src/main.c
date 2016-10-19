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
#include "hero_down.h"
#include "hero_up.h"
#include "hero_left.h"
#include "enemy.h"
#include "heart.h"
#include "map1.h"
#include "map2.h"
#include "map3.h"
#include "tiles.h"
#include "song.c"
#include "text.h"
#include "explosion.h"

#define  SI 1
#define  NO 0
#define  ORIGEN_MAPA_Y	24
#define  ORIGEN_MAPA  cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y)

#define ANCHO_PANTALLA	g_map1_W * 2  	// 2 bytes por tile de ancho
#define ALTO_MAPA g_map1_H * 4 			// 4 bytes por tile de alto

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
	u8  muerto;
  	u8  patrol; //TODO check optimization
  	u8  colision;
  	u8 	muertes;
} TEnemy;


typedef struct {
	u8  x, y;
	u8  px, py;
	u8* sprite;
	u8 lanzado;
	u8 direccion;
	u8 eje;
	u8 mover;
} TKnife;

// Mapas
#define NUM_MAPAS 3
u8* const mapas[NUM_MAPAS] = { g_map1, g_map2, g_map3 };

// enemies
u8 const spawnX[5] = {0, 40, 71, 20, 60};
u8 const spawnY[5] = {0 + ORIGEN_MAPA_Y, 20 + ORIGEN_MAPA_Y, 90 + ORIGEN_MAPA_Y, 114 + ORIGEN_MAPA_Y, 114 + ORIGEN_MAPA_Y};
TEnemy enemy[4];

TProta prota;

TKnife cu;


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

void menuFin(){
	u8* memptr;
	// borrar pantalla
	cpct_clearScreen(0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   	cpct_drawStringM0("GAME OVER", memptr, 2, 0);

   	while(1){}
}

void redibujarProta() {
	borrarProta();
	prota.px = prota.x;
	prota.py = prota.y;
	dibujarProta();
}

u8* getTilePtr(u8 x, u8 y) {
   return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
}

u8 checkCollision(int direction) { // check optimization
   u8 *headTile=0, *feetTile=0, *waistTile=0;

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


void dibujarEnemigo(TEnemy *enemy) {
	u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
	cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
}

void dibujarExplosion(TEnemy *enemy) {
	u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
	cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
}

void borrarExplosion() {
	u8 w = 4 + (enemy->px & 1);

	//u8 h = 7 + (enemy->py & 3 ? 1 : 0);
	u8 h = 7 + (enemy->py & 2 ? 1 : 0);

	cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);

}

void borrarEnemigo(TEnemy *enemy) {
	//u8 w = 4 + (enemy->px & 1);
	u8 w = 4 + (enemy->px & 1);

	//u8 h = 7 + (enemy->py & 3 ? 1 : 0);
	u8 h = 7 + (enemy->py & 2 ? 1 : 0);

	cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);

	enemy->mover = NO;
}

void redibujarEnemigo(TEnemy *enemy) {
	borrarEnemigo(enemy);
	enemy->px = enemy->x;
	enemy->py = enemy->y;
	dibujarEnemigo(enemy);
}

u8 checkEnemyCollision(int direction, TEnemy *enemy){

	u8 colisiona = 1;

	switch (direction) {
    case 0:
    	if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
			 && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
			 	&& *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
		{ // puede moverse, no colisiona con el mapa
			if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
				colisiona = 0;
				 // el cu no esta ni arriba ni abajo
			}else{
				if(cu.x > enemy->x){ //si el cu esta abajo
					if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
						colisiona = 0;

					}else{
						enemy->muerto = SI;
					}
				}else{ // el prota esta arriba
					colisiona = 0;
				}
			}
		}else{
			enemy->mira = M_izquierda;
		}
        break;
    case 1:
    	if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
			 && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
			 	&& *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
		{ // puede moverse, no colisiona con el mapa
			if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
				colisiona = 0;
				 // el cu no esta ni arriba ni abajo
			}else{
				if(enemy->x > cu.x){ //si el cu esta abajo
					if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
						colisiona = 0;

					}else{
						enemy->muerto = SI;
					}
				}else{ // el prota esta arriba
					colisiona = 0;
				}
			}
		}else{
			enemy->mira = M_derecha;
		}
        break;
    case 2:
         if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
			 && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
			 	&& *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
		{
			if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){

				colisiona = 0;

			}else{
				if(enemy->y>cu.y){
					if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
						colisiona = 0;

					}else{
						enemy->muerto = SI;
						
					}
				}else{
					colisiona = 0;

				}
			}

		}else{
			enemy->mira = M_abajo;
		}

	case 3:


		if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
			 && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
			 	&& *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
		{ // puede moverse, no colisiona con el mapa
			if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
				colisiona = 0;
				 // el cu no esta ni arriba ni abajo
			}else{
				if(cu.y > enemy->y){ //si el cu esta abajo
					if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
						colisiona = 0;

					}else{
						enemy->muerto = SI;
					
					}
				}else{ // el prota esta arriba
					colisiona = 0;
				}
			}
		}else{
			enemy->mira = M_arriba;
		}
        break;
   }
   return colisiona;
}

void moverEnemigoArriba(TEnemy *enemy){
	enemy->y--;
	enemy->y--;
	enemy->mover = SI;
}

void moverEnemigoAbajo(TEnemy *enemy){
	enemy->y++;
	enemy->y++;
	enemy->mover = SI;
}

void moverEnemigoDerecha(TEnemy *enemy){
	enemy->x++;
	enemy->mover = SI;
}

void moverEnemigoIzquierda(TEnemy *enemy){
	enemy->x--;
	enemy->mover = SI;
}

void moverEnemigo(TEnemy *enemy){
	if(!enemy->muerto){
		if(!checkEnemyCollision(enemy->mira, enemy)){

		   switch (enemy->mira) {

		    case 0:
		    	moverEnemigoDerecha(enemy);
		        break;
		    case 1:
		    	moverEnemigoIzquierda(enemy);
		        break;
		    case 2:
		        moverEnemigoArriba(enemy);
		        break;
		    case 3:
		       	moverEnemigoAbajo(enemy);
		        break;
		   }
		}
	}
}


void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
  u8 decision = cpct_getRandom_mxor_u8() % 4;

  switch (decision) {
    case 0:
    moverEnemigoAbajo(enemy);
      break;
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
  }
}

void avanzarMapa() {
	if(num_mapa < NUM_MAPAS -1) {
		mapa = mapas[++num_mapa];
		prota.x = prota.px = 2;
		prota.mover = SI;
		dibujarMapa();
		//modificarPuntuacion();
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
  		prota.sprite = g_hero_left;
  	}
}

void moverDerecha() {
	prota.mira = M_derecha;
	if (!checkCollision(M_derecha) ) {
  		prota.x++;
  		prota.mover = SI;
  		prota.sprite = g_hero;
    //}else if ( prota.x > 68 && prota.y >= 72 && prota.y <= 80){  //TODO que avance solo si estamos en el centro
	}else if( prota.x + G_HERO_W >= 80){
		avanzarMapa();
	}
}

void moverArriba() {
	prota.mira = M_arriba;
	if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
  		prota.y--;
  		prota.y--;
  		prota.mover  = SI;
  		prota.sprite = g_hero_up;
    }
}

void moverAbajo() {
	prota.mira = M_abajo;
	if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
		prota.y++;
		prota.y++;
		prota.mover  = SI;
  		prota.sprite = g_hero_down;
  }
}

void dibujarCuchillo() {
	u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
	if(cu.eje == E_X){
		cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
	}

	else if(cu.eje == E_Y){
		cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
	}
}

void borrarCuchillo() {

	u8 w = 2 + (cu.px & 1);
	u8 h = 2 + (cu.py & 3 ? 1 : 0);
	cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
	if(!cu.mover){
		cu.lanzado = NO;
	}
}

void redibujarCuchillo( ) {
	borrarCuchillo();
	cu.px = cu.x;
	cu.py = cu.y;
	dibujarCuchillo();
}


void lanzarCuchillo(){

	if(!cu.lanzado){

		if(prota.mira == M_derecha){
			if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
				cu.lanzado = SI;
				cu.direccion = M_derecha;
				cu.x=prota.x + G_HERO_W;
				cu.y=prota.y + G_HERO_H /2;
				cu.sprite=g_knifeX_0;
				cu.eje = E_X;
				dibujarCuchillo();
			}
		}
		else if(prota.mira == M_izquierda){
			if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
				cu.lanzado = SI;
				cu.direccion = M_izquierda;
				cu.x = prota.x - G_KNIFEX_0_W;
				cu.y = prota.y + G_HERO_H /2;
				cu.sprite = g_knifeX_1;
				cu.eje = E_X;
				dibujarCuchillo();
			}
		}
		else if(prota.mira == M_abajo){
			u8 valor = LIMITE_INFERIOR;
			if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
				cu.lanzado = SI;
				cu.direccion = M_abajo;
				cu.x = prota.x + G_HERO_W / 2;
				cu.y = prota.y + G_HERO_H;
				cu.sprite = g_knifeY_0;
				cu.eje = E_Y;
				dibujarCuchillo();
			}
		}
		else if(prota.mira == M_arriba){
			if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
				cu.lanzado = SI;
				cu.direccion = M_arriba;
				cu.x = prota.x + G_HERO_W / 2;
				cu.y = prota.y;
				cu.sprite = g_knifeY_1;
				cu.eje = E_Y;
				dibujarCuchillo();
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

u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){

   return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
}

void moverCuchillo(){


	if(cu.lanzado){
		cu.mover = SI;
		if(cu.direccion == M_derecha){

			if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
				cu.mover = SI;
				cu.x++;
			}
			else {
				cu.mover=NO;
			}
		}
		else if(cu.direccion == M_izquierda){
			if(checkKnifeCollision(M_derecha, -1, 0)){			
				cu.mover = SI;		
				cu.x--;
			}else{
				cu.mover=NO;
			}
		}
		else if(cu.direccion == M_arriba){
			if(checkKnifeCollision(M_derecha, 0, -2)){
				cu.mover = SI;
				cu.y--;
				cu.y--;
				
			}else{
				cu.mover=NO;
			}
		}
		else if(cu.direccion == M_abajo){
			if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
				cu.mover = SI;
				cu.y++;
				cu.y++;
				
			}else{
				cu.mover=NO;
			}
		}
	}
}
void barraPuntuacionInicial(){
	u8* memptr;
	int i;

   	//memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 176); // justo después del mapa
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
	cpct_drawStringM0("SCORE", memptr, 1, 0);
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
	cpct_drawStringM0("00000", memptr, 15, 0);
   	//cpct_drawStringM0("", memptr, 15, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
	cpct_drawStringM0("ROBOBIT", memptr, 3, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
	cpct_drawStringM0("LIVES", memptr, 1, 0);

	for(i=0; i<5; i++){
		memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
		cpct_drawSprite (g_heart, memptr, G_HEART_W, G_HEART_H);
	}
}

void borrarPantallaArriba(){
	u8* memptr;
	// No se puede borrar todo de golpe.
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 0); // posición para borrar la mitad derecha
   	cpct_drawSolidBox(memptr, 0, 40, 24);  //borra la mitad derecha
   	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 0); // posición para borrar la mitad izquierda
   	cpct_drawSolidBox(memptr, 0, 40, 24);  //borra la mitad izquierda
}

void menuInicio(){
  u8* memptr;

	// borrar pantalla
	cpct_clearScreen(0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   	cpct_drawStringM0("ROBOBIT", memptr, 4, 0);

   	cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   	cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);

	/*
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 50); // centrado en horizontal
   	cpct_drawStringM0("It is a period of", memptr, 15, 0);
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 60); // centrado en horizontal
   	cpct_drawStringM0("civil war.", memptr, 15, 0);
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 70); // centrado en horizontal
   	cpct_drawStringM0("Humans against robots.", memptr, 15, 0);
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 80); // centrado en horizontal
   	cpct_drawStringM0("Victor R. is the leader", memptr, 15, 0);
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 90); // centrado en horizontal
   	cpct_drawStringM0("of the human resistance.", memptr, 15, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 100); // centrado en horizontal
   	cpct_drawStringM0("He must destroy all the", memptr, 15, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 110); // centrado en horizontal
   	cpct_drawStringM0("robots in their way.", memptr, 15, 0);

	//memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 120); // centrado en horizontal
   	//cpct_drawStringM0("of the human resistance. He must destroy all the robots in their way.", memptr, 15, 0);
*/
   	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   	cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);

   	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   	cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);

   	// Esperar hasta pulsar S
   	do{
   		cpct_scanKeyboard_f();
   		/*if (cpct_isKeyPressed(Key_S)){
   		}
   		else */if(cpct_isKeyPressed(Key_M)){
   			cpct_scanKeyboard_f();
   			do{

   			} while(!cpct_isKeyPressed(Key_S));
   		}
   	} while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
}

void inicializarCPC() {
	cpct_disableFirmware();
	cpct_setVideoMode(0);
	cpct_setBorder(HW_BLACK);
	cpct_setPalette(g_palette, 16);
	cpct_akp_musicInit(G_song);
}

void inicializarEnemy() {
u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
//u8 i = 4 + 1; // dibuja todos de prueba

TEnemy* actual;

actual = enemy;
  while(--i){
    actual->x = actual->px = spawnX[i];
    actual->y = actual->py = spawnY[i];
    actual->mover  = NO;
    if( i % 2 == 0){
    	actual->mira   = M_abajo;
    }
    else{
    	actual->mira = M_derecha;
    }
    actual->sprite = g_enemy;
    actual->muerto = NO;
    actual->muertes = 0;
    actual->patrol = SI;

    dibujarEnemigo(actual);

    ++actual;
  }
}

void inicializarJuego() {

	num_mapa = 0;
	mapa = mapas[num_mapa];
	cpct_etm_setTileset2x4(g_tileset);

	dibujarMapa();
	
	borrarPantallaArriba();
	barraPuntuacionInicial();


	prota.x = prota.px = 4;
	prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
	prota.mover  = NO;
	prota.mira=M_derecha;
	prota.sprite = g_hero;



	cu.x = cu.px = 0;
	cu.y = cu.py = 0;
	cu.lanzado = NO;
	cu.mover = NO;

	inicializarEnemy();

	dibujarProta();
}

void main(void) {

  TEnemy* actual;
  u8 i;
	inicializarCPC();
	menuInicio();



	inicializarJuego();




   	cpct_akp_musicPlay();

   	while (1) {

   		i = 4 + 1;
   		actual = enemy;
   		
   		comprobarTeclado();
   		moverCuchillo();

  		while(--i){
   			moverEnemigo(actual);
   			++actual;
   		}
   		i = 4 + 1;
   		actual = enemy;

		cpct_waitVSYNC();

   		if (prota.mover) {
   			redibujarProta();
   			prota.mover = NO;
   		}
   		if(cu.lanzado && cu.mover){
   			redibujarCuchillo();
   		}else if (cu.lanzado && !cu.mover){
   			borrarCuchillo();
   			cu.x=0;
   			cu.y=0;
   			//cu.lanzado = NO;
   		}

   		while(--i){
	   		if(actual->mover){
	   			redibujarEnemigo(actual);
	   		}
	   		if (actual->muerto && actual->muertes == 0){
	   			borrarEnemigo(actual);
	   			dibujarExplosion(actual);
	   			
	   			actual->muertes++;
	   			actual->x = 0;
	   			actual->y = 0;
	   		}
	   		++actual;
   		}
   		cpct_waitVSYNC();
   	}
}
