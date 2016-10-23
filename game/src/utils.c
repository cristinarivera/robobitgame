#include "utils.h"
#include <cpctelera.h>

char* getTilePtr(u8*mapa, u8 x, u8 y) {
  return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
}