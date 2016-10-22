#include "menu.h"
#include "../assets/arrows.h"
#include "../assets/text.h"

void menuFin(){
  u8* memptr;
  // borrar pantalla
  cpct_clearScreen(0);

  memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
  cpct_drawStringM0("GAME OVER", memptr, 2, 0);

  while(1){}
}

void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
  u8* memptr;
  if (ancho <= 40){
    memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
    cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
  }
  else if (ancho > 40){
    // No se puede borrar todo de golpe.
    memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
    cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
    memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
    cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
  }
}

void menuInstrucciones(){ // TODO TODO
	u8* memptr;
	borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
	//borrarPantalla(0, 160, 80, 20);//borra los accesos a los menús

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);

	
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
	cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
	
	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
	cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
	cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
	cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);

  	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0(" TO MOVE", memptr, 2, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);

	do{
	    cpct_scanKeyboard_f(); 
	    if(cpct_isKeyPressed(Key_M)){
	    	menuOpciones();
	    }

  	} while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
}

void menuCreditos(){ // TODO TODO
	u8* memptr;
	borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
	//borrarPantalla(0, 160, 80, 20);//borra los accesos a los menús

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("CREDITS", memptr, 2, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);

	do{
	    cpct_scanKeyboard_f(); 
	    if(cpct_isKeyPressed(Key_M)){
	    	menuOpciones();
	    }

  	} while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));

}

void menuOpciones(){ // TODO TODO
	u8* memptr;
	borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
	//borrarPantalla(0, 160, 80, 20);//borra los accesos a los menús

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("MENU", memptr, 2, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);

	do{
		cpct_scanKeyboard_f(); 
		/*if(cpct_isKeyPressed(Key_S)){
		// al juego ...
		}
		else */ 
		if(cpct_isKeyPressed(Key_I)){
			menuInstrucciones();
			//instrucciones
			//jugar o volver al menu 
		}
		else if(cpct_isKeyPressed(Key_C)){
			menuCreditos();
			// créditos
			// jugar o volver al menu
	}




	} while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
}

void menuInicio(){
	u8* memptr;

	// borrar pantalla
	cpct_clearScreen(0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
	cpct_drawStringM0("ROBOBIT", memptr, 4, 0);

	cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
	cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);

	memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
	cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);

	// Esperar hasta pulsar S
	do{
		cpct_scanKeyboard_f();
	/*if (cpct_isKeyPressed(Key_S)){
	  }
	  else */
		if(cpct_isKeyPressed(Key_M)){
		  cpct_scanKeyboard_f();
		  do{
		    menuOpciones();

		  } while(!cpct_isKeyPressed(Key_S));
		}
	} while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
}
