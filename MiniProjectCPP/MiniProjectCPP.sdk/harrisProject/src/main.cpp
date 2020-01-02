/*
 * main.cpp
 *
 */
#include <iostream>
#include <stdio.h>
#include <string>
#include "ReadImg.h"
#include "Matrices.h"
#include "Sobel.h"

int main()
{
	int *p;					  // properties of the IMG
	VectorArray100 imgMatrix; // Matrix to storage IMG
	VectorArray3 sobelKernel3x, sobelKernel3y;
//	VectorArray100 imgIx; // Filtered IMG along X
	// int imgIx[100][100];
//	int* imgIy = new int[MSIZE100 * MSIZE100];
	//	VectorArray100 imgIy;		// Filtered IMG along Y
	VectorArray102 padMat;


	// Reading Images
	printf("Reading Image \r\n");
	p = ReadImgProperties((char *)"geeks.bmp");
	ReadImg((char *)"geeks.bmp", p[0], p[4], p[3], p[1], imgMatrix);

	// Sobel filtering
	printf("Initializing filter kernels\r\n");
	// initXKernel(sobelKernel3x);
	sobelKernel3x[0].comp[0] = 1;
	sobelKernel3x[0].comp[1] = 0;
	sobelKernel3x[0].comp[2] = -1;
	sobelKernel3x[1].comp[0] = 2;
	sobelKernel3x[1].comp[1] = 0;
	sobelKernel3x[1].comp[2] = -2;
	sobelKernel3x[2].comp[0] = 1;
	sobelKernel3x[2].comp[1] = 0;
	sobelKernel3x[2].comp[2] = -1;
	// displayMatrix3(sobelKernel3x, MSIZE3);
	

	sobelKernel3y[0].comp[0] = -1;
	sobelKernel3y[0].comp[1] = -2;
	sobelKernel3y[0].comp[2] = -1;
	sobelKernel3y[1].comp[0] = 0;
	sobelKernel3y[1].comp[1] = 0;
	sobelKernel3y[1].comp[2] = 0;
	sobelKernel3y[2].comp[0] = 1;
	sobelKernel3y[2].comp[1] = 2;
	sobelKernel3y[2].comp[2] = 1;
	// displayMatrix3(sobelKernel3y, MSIZE3);

	printf("Creating padded matrix\r\n");
	padding100(imgMatrix, padMat);
	displayMatrix102(padMat, 20);

	printf("X filter\r\n");
	int* imgIx = new int[100*100];
	for (int i = 1; i < MSIZE102 - 1; i++)
	{
		for (int j = 1; j < MSIZE102 - 1; j++)
		{
			VectorArray3 mConv;
			int k;
			for (k = -1; k < 2; k++)
			{
				int l;
				for (l = -1; l < 2; l++)
				{
					mConv[1 + k].comp[1 + l] = (signed int)padMat[i + k].comp[j + l];
				}
			}

			*(imgIx + (i - 1)*MSIZE100 + (j - 1)) = convUniDirectionSoft(sobelKernel3x, mConv, MSIZE3);
		}
	}
	printf("Printing matrix: \r\n");
	int i;
	for (i = 0; i < 20; i++)
	{
		int j;
		for (j = 0; j < 20; j++)
		{
			printf("%4d ", *(imgIx + i*MSIZE100 + j));
			if (j == 20 - 1)
				printf("\r\n");
		}
	}
//	 delete imgIx;

	// displayIntMat100(imgIx, 20, 20);

	printf("Y filter\r\n");
	int* imgIy = new int[100*100];
	for (int i = 1; i < MSIZE102 - 1; i++)
	{
		for (int j = 1; j < MSIZE102 - 1; j++)
		{
			VectorArray3 mConv;
			int k;
			for (k = -1; k < 2; k++)
			{
				int l;
				for (l = -1; l < 2; l++)
				{
					mConv[1 + k].comp[1 + l] = (signed int)padMat[i + k].comp[j + l];
				}
			}

			*(imgIy + (i - 1)*MSIZE100 + (j - 1))= convUniDirectionSoft(sobelKernel3y, mConv, MSIZE3);
		}
	}

	printf("Printing matrix: \r\n");
	for (int i = 0; i < 20; i++)
	{
		int j;
		for (j = 0; j < 20; j++)
		{
			printf("%6d ", *(imgIy + i*MSIZE100 + j));
			if (j == 20 - 1)
				printf("\r\n");
		}
	}

	return 0;
}
