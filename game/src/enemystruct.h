#ifndef _ASSETS_ENEMYSTRUCT_H_
#define _ASSETS_ENEMYSTRUCT_H_

#include <types.h>

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
  u8  camino[300];
  u8  longitud_camino;
} TEnemy;

#endif
