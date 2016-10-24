#include "utils.h"
#include <cpctelera.h>

char* getTilePtr(u8*mapa, u8 x, u8 y) {
  return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
}

i16 abs (i16 n) {
    const i16 ret[2] = { n, -n };
    return ret[n<0];
}