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
#include "assets/knifeX.h"
#include "assets/knifeY.h"
#include "assets/hero.h"
#include "assets/hero_down.h"
#include "assets/hero_up.h"
#include "assets/hero_left.h"
#include "assets/enemy.h"
#include "assets/explosion.h"
#include "maps/map1.h"
#include "maps/map2.h"
#include "maps/map3.h"
#include "maps/tiles.h"
#include "menu/menu.h"
#include "score/score.h"
#include "song/song.h"
#include "protastruct.h"
#include "knifestruct.h"
#include "enemystruct.h"
#include "utils.h"
#include "pathfinding.h"


// Mapas
#define NUM_MAPAS 3
#define  SI 1
#define  NO 0
#define  ORIGEN_MAPA_Y	24

#define ANCHO_PANTALLA	g_map1_W * 2  	// 2 bytes por tile de ancho
#define ALTO_MAPA g_map1_H * 4 			// 4 bytes por tile de alto

#define LIMITE_IZQUIERDO 0 + 4
#define LIMITE_DERECHO ANCHO_PANTALLA - 4 + G_KNIFEX_0_W

#define LIMITE_SUPERIOR 0 + 8 + ORIGEN_MAPA_Y
#define LIMITE_INFERIOR ALTO_MAPA - 8 + ORIGEN_MAPA_Y


#define ALTO_PROTA 22

#define M_derecha 0
#define M_izquierda 1
#define M_arriba 2
#define M_abajo 3

#define E_X 0
#define E_Y 1

u8* const mapas[NUM_MAPAS] = { g_map1, g_map2, g_map3 };

// enemies
u8 const spawnX[4] = {36, 71, 48, 24};
u8 const spawnY[4] = {20 + ORIGEN_MAPA_Y, 78 + ORIGEN_MAPA_Y, 130 + ORIGEN_MAPA_Y, 40 + ORIGEN_MAPA_Y};

u8 const patrolX[4][5] = {
  {0, 0, 0, 0, 0} ,
  {66, 51, 0, 0} ,
  {16, 51, 25, 0} ,
  {36, 60, 48, 24}
};

u8 const patrolY[4][5] = {
  {0, 0, 0, 0} ,
  {70 + ORIGEN_MAPA_Y, 142 + ORIGEN_MAPA_Y, 0, 0} ,
  {20 + ORIGEN_MAPA_Y, 78 + ORIGEN_MAPA_Y, 130 + ORIGEN_MAPA_Y, 0} ,
  {120 + ORIGEN_MAPA_Y, 78 + ORIGEN_MAPA_Y, 20 + ORIGEN_MAPA_Y, 110 + ORIGEN_MAPA_Y}
};

TEnemy enemy[4];

TProta prota;

TKnife cu;


u8* mapa;
u8  num_mapa;


// es el color 8 - 4D - FF00FF
// Si el modo fuera 1 solo podríamos tener el 0, 1, 2, 3

u8 puntuacion;
u8 vidas;

cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
extern void play();

void dibujarMapa() {
  u8* p;
  p = cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y);
  cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
}

void dibujarProta() {
  u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
  cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
}

void borrarProta() {
  u8 *p;

  //u8 w = 4 + (prota.px & 1);
  u8 w = 4 + (prota.px & 1);

  //u8 h = 7 + (prota.py & 3 ? 1 : 0);
  u8 h = 6 + (prota.py & 2 ? 1 : 0);
  p =  cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y);
  cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
}

void redibujarProta() {
  borrarProta();
  prota.px = prota.x;
  prota.py = prota.y;
  dibujarProta();
}

void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
  cpct_scanKeyboard_if();

  if (cpct_isAnyKeyPressed()) {
    if (cpct_isKeyPressed(Key_CursorLeft)){
      moverIzquierda();
    }else if (cpct_isKeyPressed(Key_CursorRight)){
      moverDerecha();
    }else if (cpct_isKeyPressed(Key_CursorUp)){
      moverArriba();
    }else if (cpct_isKeyPressed(Key_CursorDown)){
      moverAbajo();
    }else if (cpct_isKeyPressed(Key_Space)){
      lanzarCuchillo(cu, prota, mapa, g_tablatrans);
    }
  }
}

u8 checkCollision(u8 direction) { // check optimization
  u8 *headTile=0, *feetTile=0, *waistTile=0;

  switch (direction) {
    case 0:
    headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
    feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
    waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
    break;
    case 1:
    headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
    feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
    waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
    break;
    case 2:
    headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
    feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
    *waistTile = 0;
    break;
    case 3:
    headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
    feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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

void borrarExplosion(TEnemy *enemy) {
  u8* p;

  u8 w = 4 + (enemy->px & 1);
  u8 h = 6 + (enemy->py & 2 ? 1 : 0);
  p = cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y);
  cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);

}

void borrarEnemigo(u8 x, u8 y) {
  u8* p;


  u8 w = 4 + (x & 1);

  u8 h = 6 + (y & 3 ? 1 : 0);
  p = cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y);
  cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
}

void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
  borrarEnemigo(x, y);
  enemy->px = enemy->x;
  enemy->py = enemy->y;
  dibujarEnemigo(enemy);
}


void checkEnemyDead(u8 direction, TEnemy *enemy){

  switch (direction) {

    case 0:
      if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
        if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
          if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
            enemy->muerto = SI;
          }
        }
      }
      break;
    case 1:
      if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
        if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
          if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
            enemy->muerto = SI;
          }
        }
      }
      break;

    case 2:
      if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
        if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
          if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
            enemy->muerto = SI;
          }
        }
      }
      break;
    case 3:
        if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
          if(enemy->y>cu.y){
            if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
              enemy->muerto = SI;
            }
          }
        }
        break;
  }
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
  enemy->x++;
  enemy->mover = SI;
}

void moverEnemigoIzquierda(TEnemy *enemy){
  enemy->x--;
  enemy->x--;
  enemy->mover = SI;
}

void moverEnemigoPatrol(TEnemy* enemy){

  if(!enemy->muerto){
    if (!enemy->reversePatrol) {
      if(enemy->iter < enemy->longitud_camino){
        if(enemy->iter == 0){
          enemy->mover = SI;
          enemy->iter = 2;
          enemy->x = enemy->camino[enemy->iter];
          ++enemy->iter;
          enemy->y = enemy->camino[enemy->iter];
          ++enemy->iter;
        }else{
          enemy->mover = SI;
          enemy->x = enemy->camino[enemy->iter];
          ++enemy->iter;
          enemy->y = enemy->camino[enemy->iter];
          ++enemy->iter;
        }
      }
      else{
        enemy->mover = NO;
        enemy->iter = enemy->longitud_camino;
        enemy->reversePatrol = 1;
      }
    } else {
      if(enemy->iter > 0){
        if(enemy->iter == enemy->longitud_camino){
          enemy->mover = SI;
          enemy->iter = enemy->iter - 1;
          enemy->iter = enemy->iter - 2;
          enemy->y = enemy->camino[enemy->iter];
          --enemy->iter;
          enemy->x = enemy->camino[enemy->iter];
          --enemy->iter;
        }else{
          enemy->mover = SI;
          enemy->y = enemy->camino[enemy->iter];
          --enemy->iter;
          enemy->x = enemy->camino[enemy->iter];
          --enemy->iter;
        }
      }
      else{
        enemy->mover = NO;
        enemy->iter = 0;
        enemy->reversePatrol = 0;
      }
    }
  }
}

void lookFor(TEnemy* enemy){


  u8 i;
  u8 interpone = NO;
  u8 dist = 0;
  i16 difx = abs((i16)(enemy->x - prota.x));
  i16 dify = abs((i16)(enemy->y/2 - prota.y/2));

  dist = difx + dify; // manhattan
  enemy->seen = NO;
  enemy->in_range = NO;

  if(!enemy->seek){
    if (dist <= 20) {// te detectan los sensores de proximidad
      enemy->in_range = 1;
      enemy->engage = 1;
      enemy->seen = SI;
    }else if(prota.x > enemy->x - 16 && prota.x < enemy->x + 16
      && prota.y > enemy->y - 16*2 && prota.y < enemy->y +16*2){
        enemy->seen = SI;
    }
  }
}

void moverEnemigoSeek(TEnemy* actual){

  if(!actual->muerto){


    if(actual->iter < actual->longitud_camino){


      if(actual->iter == 0){

        actual->mover = SI;
        actual->iter = 2;
        actual->x = actual->camino[actual->iter];
        ++actual->iter;
        actual->y = actual->camino[actual->iter];
        ++actual->iter;

      }else{
        actual->mover = SI;
        actual->x = actual->camino[actual->iter];
        ++actual->iter;
        actual->y = actual->camino[actual->iter];
        ++actual->iter;

      }
    }

    else{
      actual->seek = 0;
      lookFor(actual);
      if(!actual->seen){
        actual->patrolling = 1;
        pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
      }else{
        actual->patrolling = 0;
        if(!actual->engage){
          actual->seek = 1;
          pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
        }
      }
      actual->iter = 0;
    }

  }
}


void engage(TEnemy *enemy, u8 dx, u8 dy) {
  u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
  u8 dify = abs(enemy->y - prota.y);
  u8 dist = difx + dify; // manhattan

  u8 movX = 0;
  u8 movY = 0;
  u8 distConstraint = 25;
  enemy->mover = NO;

  if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
    if (dx < enemy->x) { // izquierda
      if (dist > 11) {
        if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
        && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
        && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
          moverEnemigoIzquierda(enemy);
          movX = 1;
          enemy->mover = SI;
        }
      }
    } else { // derecha
      if (dist > G_ENEMY_W + 3) {
        if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
          moverEnemigoDerecha(enemy);
          movX = 1;
          enemy->mover = SI;
        }
      }
    }
  }
  else if (enemy->x == dx) {
    if (dy < enemy->y) {
      if (dist > G_HERO_H + 5) {
        if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
          moverEnemigoArriba(enemy);
          movY = 1;
          enemy->mover = SI;
        }
      }
    } else {
      if(dist > G_ENEMY_H + 7) {
        if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
          moverEnemigoAbajo(enemy);
          movY = 1;
          enemy->mover = SI;
        }
      }
    }
  }
  else { // heuristica
    if (!prota.mover) distConstraint = 20; // ajuste en parado

    if (dist > distConstraint) {
      if (dx + 1 < enemy->x) {
        if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
        && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
        && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
          moverEnemigoIzquierda(enemy);
          movX = 1;
          enemy->mover = SI;
        }
      } else if (dx + 1 > enemy->x){
        if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
          moverEnemigoDerecha(enemy);
          movX = 1;
          enemy->mover = SI;
        }
      }
      if (dy < enemy->y) {
        if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
          moverEnemigoArriba(enemy);
          movY = 1;
          enemy->mover = SI;
        }
      } else {
        if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
        && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
          moverEnemigoAbajo(enemy);
          movY = 1;
          enemy->mover = SI;
        }
      }
      if (!enemy->mover) {
        if (!movX) {
          if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
            if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
            && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
            && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
              moverEnemigoAbajo(enemy);
              enemy->mover = SI;
            } else {
              moverEnemigoArriba(enemy);
              enemy->mover = SI;
            }
          } else {
            if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
            && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
            && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
              moverEnemigoArriba(enemy);
              enemy->mover = SI;
            } else {
              moverEnemigoAbajo(enemy);
              enemy->mover = SI;
            }
          }
        }

        if (!movY) {
          if (enemy->x < ANCHO_PANTALLA/2) {
            if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
            && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
            && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
              moverEnemigoIzquierda(enemy);
              enemy->mover = SI;
            } else {
              moverEnemigoDerecha(enemy);
              enemy->mover = SI;
            }
          } else {
            if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
            && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
            && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
              moverEnemigoDerecha(enemy);
              enemy->mover = SI;
            }
            else {
              moverEnemigoIzquierda(enemy);
              enemy->mover = SI;
            }
          }
        }
      }
    }
  }
}

void updateEnemy(TEnemy* actual) { // maquina de estados

  if (actual->engage) { // prioridad a la persecucion, nunca te deja
    engage(actual, prota.x, prota.y);
  } else {
    lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
    if (actual->patrolling) {
      // esta patrullando
      moverEnemigoPatrol(actual);
      if (actual->in_range) {
        engage(actual, prota.x, prota.y);
        actual->patrolling = 0;
        actual->engage = 1;
      } else if (actual->seen) {
        pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
        actual->p_seek_x = actual->x;
        actual->p_seek_y = actual->y;
        actual->seek = 1;
        actual->iter=0;
        actual->reversePatrol = NO;
        actual->patrolling = 0;
        actual->seen = 0;
      }
    } else if (actual->seek) {
      moverEnemigoSeek(actual);
      if (actual->in_range) {
        engage(actual, prota.x, prota.y);
        actual->seek = 0;
        actual->engage = 1;
      } else if (actual->seen) {

      }
    }
  }
}

void inicializarEnemy() {
    u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
    //u8 i = 4 + 1; // sacar todos
    //u8 i = 2;
    TEnemy* actual;

    u8 aux0, aux1, k;

    aux0 = 0;
    aux1 = 0;

    actual = enemy;
    while(i){
      --i;
      actual->x = actual->px = spawnX[i];
      actual->y = actual->py = spawnY[i];
      actual->mover  = NO;
      actual->mira   = M_abajo;
      actual->sprite = g_enemy;
      actual->muerto = NO;
      actual->muertes = 0;
      actual->patrolling = SI;
      actual->reversePatrol = NO;
      actual->iter = 0;
      actual->lastIter = 0;
      actual->in_range = 0,
      actual->seek = 0;
      actual->seen = 0;
      actual->found = 0;
      actual->engage = 0;
      pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
      dibujarEnemigo(actual);
      ++actual;
    }
}

void avanzarMapa() {
  if(num_mapa < NUM_MAPAS -1) {
    mapa = mapas[++num_mapa];
    prota.x = prota.px = 2;
    prota.mover = SI;
    dibujarMapa();
    inicializarEnemy();
  }
  else{
    menuFin(puntuacion);
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
  if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
    prota.x++;
    prota.mover = SI;
    prota.sprite = g_hero;
  }else if( prota.x + G_HERO_W >= 80){
    avanzarMapa();
  }
}

void moverArriba() {
  prota.mira = M_arriba;
  if (!checkCollision(M_arriba)) {
    prota.y--;
    prota.y--;
    prota.mover  = SI;
    prota.sprite = g_hero_up;
  }
}

void moverAbajo() {
  prota.mira = M_abajo;
  if (!checkCollision(M_abajo) ) {
    prota.y++;
    prota.y++;
    prota.mover  = SI;
    prota.sprite = g_hero_down;
  }
}



u8 i;
void intHandler() {
  if (++i == 6) {
    play();
    i=0;
  }
}

void inicializarCPC() {
  cpct_disableFirmware();
  cpct_setVideoMode(0);
  cpct_setBorder(HW_BLACK);
  cpct_setPalette(g_palette, 16);
  //cpct_akp_musicInit(g_song);
  //cpct_setInterruptHandler(intHandler);
}

void inicializarJuego() {

  num_mapa = 2;


  // es el color 8 - 4D - FF00FF
  // Si el modo fuera 1 solo podríamos tener el 0, 1, 2, 3

  puntuacion = 0;
  vidas = 5;
  mapa = mapas[num_mapa];
  cpct_etm_setTileset2x4(g_tileset);

  dibujarMapa();

  //borrarPantalla(0, 0, 40, 1);
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
  cu.off_bound = NO;

  inicializarEnemy();

  dibujarProta();
}

void main(void) {
  u8* memptr;
  TEnemy* actual;
  u8 i;
  u16 puntuacion_aux = 0;
  inicializarCPC();

  menuInicio();

  inicializarJuego();

  //cpct_akp_musicPlay();

  while (1) {

    i = 2 + num_mapa;
    actual = enemy;

    comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
    moverCuchillo(&cu, mapa);
    while(i){

      --i;
      if(!actual->muerto){
        checkEnemyDead(cu.direccion, actual);
      }
      if(!actual->muerto){
        updateEnemy(actual);
      }
      ++actual;
    }

    cpct_waitVSYNC();
    //cpct_akp_musicPlay();

    if (prota.mover) {
      redibujarProta();
      prota.mover = NO;
    }
    if(cu.lanzado && cu.mover){
      redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
    }else if (cu.lanzado && !cu.mover){
      borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
      cu.lanzado = NO;
      cu.x = 0;
      cu.y=0;
    }

    i = 2 + num_mapa;
    actual = enemy;
    while(i){

      --i;
      if(actual->mover){
        redibujarEnemigo((*actual).px, (*actual).py, actual);
      }

      if (actual->muerto && actual->muertes == 0){
        borrarEnemigo((*actual).x, (*actual).y);
        dibujarExplosion(actual);
        puntuacion_aux = puntuacion;
        puntuacion = aumentarPuntuacion(puntuacion_aux);
        modificarPuntuacion(puntuacion);
        actual->mover = NO;
        actual->muertes++;
        actual->x = 0;
        actual->y = 0;
      }
      ++actual;
    }
    cpct_waitVSYNC();

  }
}

/* TODO TODO
u8 vidas_aux;
vidas_aux = vidas;
vidas = quitarVidas(vidas_aux);
if (vidas == 0) menuFin(puntuacion);



*/
