// Data created with Img2CPC - (c) Retroworks - 2007-2015
#ifndef _ASSETS_ENEMY_H_
#define _ASSETS_ENEMY_H_

#include <types.h>
#define G_ENEMY_W 4
#define G_ENEMY_H 22
extern const u8 g_enemy[4 * 22];

typedef struct {
  u8  x, y;
  u8  px, py;
  u8* sprite;
  u8  mover;
  u8  mira;
  u8  muerto;
  u8  patroling;  // si esta patrullando
  u8  lastPatrol; // ultima direccion en la que patrullo
  u8  colision;
  u8 	muertes;
} TEnemy;

#endif
