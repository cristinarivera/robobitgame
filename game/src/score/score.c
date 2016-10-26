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

#include "score.h"
#include "../assets/heart.h"
#include "../menu/menu.h"


void barraPuntuacionInicial(){
  u8* memptr;
  int i;

  memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
  cpct_drawStringM0("SCORE", memptr, 1, 0);
  memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
  cpct_drawStringM0("00000", memptr, 15, 0);

  memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
  cpct_drawStringM0("LIVES", memptr, 1, 0);

  for(i=0; i<5; i++){
    memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
    cpct_drawSprite (g_heart, memptr, G_HEART_W, G_HEART_H);
  }
}

void modificarPuntuacion(u16 puntuacion){
  u8* memptr;
  u16 puntuacion_aux = puntuacion;
  borrarPantalla(0, 14, 25, 7);
  memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial

  cpct_drawCharM0(memptr, 2, 0, (puntuacion_aux%10) + 48);
  puntuacion_aux = puntuacion / 1000;
  cpct_drawCharM0(memptr+4, 2, 0, (puntuacion_aux%10) + 48);
  puntuacion_aux = puntuacion / 100;
  cpct_drawCharM0(memptr+8, 2, 0, (puntuacion_aux%10) + 48);
  puntuacion_aux = puntuacion / 10;
  cpct_drawCharM0(memptr+12, 2, 0, (puntuacion_aux%10) + 48);
  puntuacion_aux = puntuacion;
  cpct_drawCharM0(memptr+16, 2, 0, (puntuacion_aux%10) + 48);

}

void modificarVidas(u8 vidas){
  u8 i;
  u8 *memptr;
  borrarPantalla(60, 14, 20, 6);

  for(i = 0; i<vidas; i++){
    if(i%20 == 0){
      memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + (i/20)*4, 14); // dibuja 5 corazones
      cpct_drawSprite (g_heart, memptr, G_HEART_W, G_HEART_H);
    }
  }
}

u16 aumentarPuntuacion(u16 puntuacion){
  return puntuacion + 10;
}
