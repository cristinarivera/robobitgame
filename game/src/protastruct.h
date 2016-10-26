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

#ifndef _ASSETS_PROTASTRUCT_H_
#define _ASSETS_PROTASTRUCT_H_

#include <types.h>

typedef struct {
  u8  x, y;
  u8  px, py;
  u8* sprite;
  u8  mover;
  u8  mira;
} TProta;

#endif
