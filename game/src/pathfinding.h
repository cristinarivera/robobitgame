#ifndef PATHFINDING_H_
#define PATHFINDING_H_

#include "enemystruct.h"
#include "string.h"
#include <cpctelera.h>

i16 abs(i16 n);
u8 anyadirALista(u8 x, u8 y);
u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8 matriz[]);
void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8 matriz[]);

#endif
