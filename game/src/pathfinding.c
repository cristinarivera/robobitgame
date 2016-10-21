#include "pathfinding.h"


const unsigned int bitWeights[8] = {1,2,4,8,16,32,64,128};


u8 sol_tam;
u8 sol_matriz[(40*2*44*4)/8];

u8 camino[70];



i16 abs (i16 n) {
    const i16 ret[2] = { n, -n };
    return ret[n<0];
}

u8 getBit(u8 *array, u16 pos)
{
	u16 byteV;
	u16 bitV;

	byteV = array[pos/8];
	bitV = bitWeights[pos%8];
	return (byteV & bitV) == bitV;
}

void setBit(u8 *array, u16 pos, u16 value)
{
	u16 byteV;
	u16 bytePos;
	u16 bitV;

	bytePos = pos/8;
	byteV = array[bytePos];
	bitV = bitWeights[pos%8];

	if(value == 0)
	{
		if(getBit(array, pos) != 0) array[bytePos] -= bitV;
	}
	else
	{
		if(getBit(array, pos) == 0) array[bytePos] += bitV;
	}

}

u8 anyadirALista(u8 x, u8 y){
	u8 anyadido = 0;

	if(sol_tam < 70){
		camino[sol_tam-1] = x;
		sol_tam++;
		camino[sol_tam-1] = y;
		sol_tam++;
		anyadido = 1;
	}

	return anyadido;

}

u8 adjacentTiles(u8 x, u8 y, u8 s_x, u8 s_y, u8 f_x, u8 f_y, u8* matriz){
	u8 resultado = 4;

	i16 dist1 = 0;
	i16 dist2 = 0;
	i16 dist3 = 0;
	i16 dist4 = 0;

	i16 heu_derecha = 0;
	i16 heu_izquierda = 0;
	i16 heu_arriba = 0;
	i16 heu_abajo = 0;

	
	
	if(x == f_x){

		if(s_x < x){
			setBit(sol_matriz, (y-24) * 44*4 + (x-1), 1);
		}else{
			setBit(sol_matriz, (y-24) * 44*4 + (x+1), 1);
			
		}

		if(y < f_y)
			heu_abajo = -1;
		
		if(y > f_y)
			heu_arriba = -1;

	}else if(y == f_y){

		if(s_y < y){
			setBit(sol_matriz, ((y-24)-1) * 44*4 + x, 1);
		}
		else{
			setBit(sol_matriz, ((y-24)+1) * 44*4 + x, 1);
		}

		if(x < f_x)
			heu_derecha = -1;
		if(x > f_x)
			heu_izquierda = -1;

	}
	else{

		if(s_x < f_x){
			if(s_y < f_y)
				heu_abajo = -1;
			else
				heu_arriba = -1;

			heu_derecha = -1;
		}else if(s_x > f_x){

			if(s_y < f_y)
				heu_abajo = -1;
			else
				heu_arriba = -1;

			heu_izquierda = -1;
		}

	}

	if( /* *(matriz + (( (y - 1) - 24)/4)*40 + x/2) <=2 &&*/ getBit(sol_matriz, ((y-1)-24) * 44*4 + x) != 1){
		dist1 = abs(f_x - x) + abs(f_y - (y-1)) + heu_arriba;
		resultado = 0;
	}

	if(  /**(matriz + (( (y + 1) - 24)/4)*40 + x/2) <=2 &&*/ getBit(sol_matriz, ((y+1)-24) * 44*4 + x) != 1){
		dist2 = abs(f_x - x) + abs(f_y - (y+1)) + heu_abajo;
		if(resultado == 0){
			if(dist1 > dist2)
				resultado = 1;	
		}else{
			resultado = 1;
		}
	}

	if( /* *(matriz + ((y-24)/4)*40 + (x-1)/2) <=2 && */getBit(sol_matriz, (y-24) * 44*4 + (x-1)) != 1){
		dist3 = abs(f_x - (x-1)) + abs(f_y - y) + heu_izquierda;
		if(resultado == 0){
			if(dist1 >= dist3)
				resultado = 2;
		}else if(resultado == 1){
			if(dist2 >= dist3)
				resultado = 2;
		}else{
			resultado = 2;
		}
	}

	if( /* *(matriz + ((y - 24)/4)*40 + (x+1)/2)  <=2 &&*/ getBit(sol_matriz, (y-24) * 44*4 + (x+1)) != 1){
		dist4 = abs(f_x - (x+1)) + abs(f_y - y) + heu_derecha;
		if(resultado == 0){
			if(dist1 >= dist4)
				resultado = 3;
		}else if(resultado == 1){
			if(dist2 >= dist4)
				resultado = 3;
		}else if (resultado == 2){
			if(dist3 >= dist4)
				resultado = 3;
		}else{
			resultado = 3;
		}
	}

	return resultado;

}

void pathFinding(u8 s_x, u8 s_y, u8 f_x, u8 f_y, TEnemy* enemy, u8* matriz){
	
	

	u8 aux;
	u8 i, j, k;
	u8 inserted;
	u8 movimiento;
	u8 x;
	u8 y;
	u8* memptr;

	u16 down = ((y-24)+1)*44*4 + x;
	u16 up = ((y-24)-1)*44*4 + x;
	u16 right = (y-24) * 44*4 + (x+1);
	u16 left = (y-24) * 44*4 + (x-1);

	u8 problem = 0;

	x = s_x;

	y = s_y;
	
	k = 0;
	aux = 1;


	memset(sol_matriz, 0, (40*2*44*4)/8);
	enemy->longitud_camino = 0;
	sol_tam = 1;
	setBit(sol_matriz, (y-24)*44*4 + x, 1);
	inserted = anyadirALista(x, y);



	while (aux){
		if( (x == f_x && y == f_y) || sol_tam == 0 || inserted == 0){
			
			if(inserted == 0 || sol_tam == 0){
				problem = 1;
			}

			aux = 0;
		}else{
			movimiento = adjacentTiles(x, y, s_x, s_y, f_x, f_y, matriz);

			switch(movimiento){
				case 0:
				 ¡
					setBit(sol_matriz, up, 1);
					inserted = anyadirALista(x, y-1);
					y = y-1;
					k = k+2;
					break;
				case 1:
				 
					setBit(sol_matriz, down, 1);
					inserted = anyadirALista(x, y+1);
					y = y+1;
					k = k+2;
					break;
				case 2:
					 
					setBit(sol_matriz, left, 1);
					inserted = anyadirALista(x-1, y);
					x = x-1;
					k = k+2;
					break;
				case 3:
				
					setBit(sol_matriz, right, 1);
					inserted = anyadirALista(x+1, y);
					x = x+1;
					k = k+2;
					break;

				case 4:
					 
					setBit(sol_matriz, (y*44*4 + x), 1);

					sol_tam = sol_tam - 2;
					k--;
					y = camino[k];
					k--;
					x = camino[k];
					break;
			}
		}
		
	}

	if(problem == 0){
		if(sol_tam < 70){
			enemy->longitud_camino = sol_tam;
		}else{
			enemy->longitud_camino = 70;
		}

		for(j = 0; j<70; j++){
			enemy->camino[j] = camino[j];
		}
	}
}
