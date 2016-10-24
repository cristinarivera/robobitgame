#include "knifestruct.h"

void dibujarCuchillo(TKnife* cu, u8* g_tablatrans) {
  u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
  if(cu->eje == E_X){
    cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
  }

  else if(cu->eje == E_Y){
    cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
  }
}

void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {

  u8* p;
  u8 w, h;  

  if(eje == E_X){
      w = 4 + (x & 1);
      h = 1 + (y & 3 ? 1 : 0);
  }else{
      w = 2 + (x & 1);
      h = 2 + (y & 3 ? 1 : 0);
  }

  p =  cpctm_screenPtr(CPCT_VMEM_START, 0, ORIGEN_MAPA_Y);
  cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
}

void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
  borrarCuchillo(eje, x, y, mapa);
  cu->px = cu->x;
  cu->py = cu->y;
  dibujarCuchillo(cu, g_tablatrans);
}

void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){

  if(!cu->lanzado){

    if(prota->mira == M_derecha){
      if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
        cu->lanzado = SI;
        cu->direccion = M_derecha;
        cu->x=prota->x + G_HERO_W;
        cu->y=prota->y + G_HERO_H /2;
        cu->sprite=g_knifeX_0;
        cu->eje = E_X;
        dibujarCuchillo(cu, g_tablatrans);
      }
    }
    else if(prota->mira == M_izquierda){
      if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
        cu->lanzado = SI;
        cu->direccion = M_izquierda;
        cu->x = prota->x - G_KNIFEX_0_W;
        cu->y = prota->y + G_HERO_H /2;
        cu->sprite = g_knifeX_1;
        cu->eje = E_X;
        dibujarCuchillo(cu, g_tablatrans);
      }
    }
    else if(prota->mira == M_abajo){
      u8 valor = LIMITE_INFERIOR;
      if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
        cu->lanzado = SI;
        cu->direccion = M_abajo;
        cu->x = prota->x + G_HERO_W / 2;
        cu->y = prota->y + G_HERO_H;
        cu->sprite = g_knifeY_0;
        cu->eje = E_Y;
        dibujarCuchillo(cu, g_tablatrans);
      }
    }
    else if(prota->mira == M_arriba){
      if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
        cu->lanzado = SI;
        cu->direccion = M_arriba;
        cu->x = prota->x + G_HERO_W / 2;
        cu->y = prota->y - G_KNIFEY_0_H;
        cu->sprite = g_knifeY_1;
        cu->eje = E_Y;
        dibujarCuchillo(cu, g_tablatrans);
      }
    }
  }
}



u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){

   return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
}

void moverCuchillo(TKnife* cu, u8* mapa){
	if(cu->lanzado){
		cu->mover = SI;
		if(cu->direccion == M_derecha){

			if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
				cu->mover = SI;
				cu->x++;
			}
			else {
				cu->mover=NO;
			}
		}
		else if(cu->direccion == M_izquierda){
			if(checkKnifeCollision(cu, -1, 0, mapa)){
				cu->mover = SI;
				cu->x--;
			}else{
				cu->mover=NO;
			}
		}
		else if(cu->direccion == M_arriba){
			if(checkKnifeCollision(cu, 0, -2, mapa)){
				cu->mover = SI;
				cu->y--;
				cu->y--;

			}else{
				cu->mover=NO;
			}
		}
		else if(cu->direccion == M_abajo){
			if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
				cu->mover = SI;
				cu->y++;
				cu->y++;

			}else{
				cu->mover=NO;
			}
		}
	}
}