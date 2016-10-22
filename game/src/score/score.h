#ifndef _SCORE_H
#define _SCORE_H

#include <types.h>
#include <cpctelera.h>

void barraPuntuacionInicial();

void modificarPuntuacion(u16 puntuacion);

void modificarVidas(u8 vidas);

u16 aumentarPuntuacion(u16 puntuacion);

u8 quitarVidas(u8 vidas);

#endif