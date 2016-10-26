//-----------------------------LICENSE NOTICE------------------------------------
// This file is part of Robobit.
// Copyright (C) 2016 ROBOBIT @Robobit_ua robobit.ua@gmail.com
// @cristina_riv  @sanchopez  nandovm95@gmail.com

// Robobit is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// Robobit is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

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
  u8  didDamage;
  u8  p_seek_x;
  u8  p_seek_y;
  u8  xplot;
  u8  camino[200];
  u8  longitud_camino;
} TEnemy;

#endif
