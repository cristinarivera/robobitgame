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
  u8  colision;
  u8  muertes;
  u8  patrolling;  // esta patrullando?
  u8  reversePatrol;
  u8  last_patrol;
  i16  iter;
  u8  lastIter;
  u8  in_range; // tiene al prota en rango?
  u8  seen;    // ha visto al prota?
  u8  found;  // ha encontrado al prota?
  u8  seek;    // esta buscando al prota?
  u8  seekTimer; // contador de tiempo buscando
  u8  engage; // esta atacando/persiguiendo al jugador?
  u8  p_seek_x;
  u8  p_seek_y;

  u8  camino[200];
  u8  longitud_camino;
} TEnemy;

#endif
