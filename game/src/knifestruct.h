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

#ifndef _ASSETS_KNIFESTRUCT_H_
#define _ASSETS_KNIFESTRUCT_H_

#include <types.h>
#include "utils.h"
#include "assets/knifeX.h"
#include "assets/knifeY.h"
#include "maps/map1.h"
#include "protastruct.h"
#include "assets/hero.h"


#define M_derecha 0
#define M_izquierda 1
#define M_arriba 2
#define M_abajo 3

#define E_X 0
#define E_Y 1

#define  SI 1
#define  NO 0
#define  ORIGEN_MAPA_Y	24

#define ANCHO_PANTALLA	g_map1_W * 2  	// 2 bytes por tile de ancho
#define ALTO_MAPA g_map1_H * 4 			// 4 bytes por tile de alto

#define LIMITE_IZQUIERDO 0 + 4
#define LIMITE_DERECHO ANCHO_PANTALLA - 4 + G_KNIFEX_0_W

#define LIMITE_SUPERIOR 0 + 8 + ORIGEN_MAPA_Y
#define LIMITE_INFERIOR ALTO_MAPA - 8 + ORIGEN_MAPA_Y




typedef struct {
  u8  x, y;
  u8  px, py;
  u8* sprite;
  u8 lanzado;
  u8 direccion;
  u8 eje;
  u8 mover;
  u8 off_bound;
} TKnife;

void dibujarCuchillo(TKnife* cu, u8* g_tablatrans);

void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa);
void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa);
void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans);


u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa);
u8 checkOffBounds(TKnife* cu);

void moverCuchillo(TKnife* cu, u8* mapa);


#endif
