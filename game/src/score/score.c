#include "score.h"
#include "../assets/heart.h"


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