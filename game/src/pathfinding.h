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

#ifndef PATHFINDING_H_
#define PATHFINDING_H_

#include "enemystruct.h"
#include "assets/enemy.h"
#include "string.h"
#include "utils.h"
#include <cpctelera.h>
#include "assets/hero.h"

u8 anyadirALista(u8 x, u8 y);
u8 adjacentTiles(u8 x, u8 y, u8 f_x, u8 f_y, u8 matriz[]);
void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8 matriz[]);

#endif
