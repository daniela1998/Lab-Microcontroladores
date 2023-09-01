#include <pic14/pic12f675.h>

typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDTE_OFF & _WDT_OFF & _MCLRE_OFF);

// Se definen las funciones a utilizar para el delay y el rand_num
void delay (unsigned tiempo);
unsigned int rand(unsigned int min_value, unsigned int max_value);

void main(void)
{
    // Todos los pines son salidas menos GP3
    TRISIO = 0b00000000;
    // Pines se ponen en bajo
    GPIO = 0x00;
    // Valor inicial del num rand
    int rand_num =0b101;
    // Cambia el valor del rand
    int new = 0b000;
    // Inicializa el tiempo 
    unsigned int time = 100;

    //Siempre se corre
    while ( 1 )
    {
        // Se generan los numeros aleatorios con linear-feedback shift register method 
		newbit=(rand_num ^ (rand_num >> 1)) & 1;
		rand_num= (rand_num >> 1) | (new << 2);
        // Si se presiona el boton 
		if (GP3)
		{
            // Si la cara es 1
            if (rand_num == 0b001){

                GPIO = 0b00000010;
                delay(time);
                GPIO = 0b00000000;
            }
            // Si la cara es 2
            if(rand_num == 0b010){
                GPIO = 0b00000100;
                delay(time);
                GPIO = 0b00000000;
            }
            // Si la cara es 3
            if (rand_num == 0b011){
                GPIO = 0b00000110;
                delay(time);
                GPIO = 0b00000000;
            }
            // Si la cara es 4
            if (rand_num == 0b100){
                GPIO = 0b00000101;
                delay(time);
                GPIO = 0b00000000;
            }
            // Si la cara es 5
             if (rand_num == 0b100){
                GPIO = 0b00000111;
                delay(time);
                GPIO = 0b00000000;
             }
             // Si la cara es 6
             if (rand_num == 0b100){
                GPIO = 0b00010101;
                delay(time);
                GPIO = 0b00000000;
             }
}
}
}


// Funcion necesaria para el delay
void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}