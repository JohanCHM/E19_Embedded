/*
 * main.cpp
 *
 */
#include <stdio.h>
#include <string>
#include "ReadImg.h"
#include "Matrices.h"
#include "Sobel.h"


int main()
{
   	int *p;						// properties of the IMG
	VectorArray100 imgMatrix;	// Matrix to storage IMG
	VectorArray100 imgIx;		// Filtered IMG along X
	VectorArray100 imgIy;		// Filtered IMG along Y

	// Reading Images
	printf("Reading Image \r\n");
	p = ReadImgProperties((char *)"geeks.bmp");
	ReadImg((char *)"geeks.bmp", p[0], p[4],p[3], p[1], imgMatrix);

	// Sobel filtering
	printf("Initializing filters\r\n");
	initKernels();

	printf("X filter\r\n");
	winIxSoft(imgMatrix, imgIx);
	printf("Y filter\r\n");
	winIySoft(imgMatrix, imgIy);

	// Display for Testing
	//printf("mat %d\r\n", imgMatrix[1].comp[0]);
	displayMatrix100(imgIx, 100);

	return 0;
}
