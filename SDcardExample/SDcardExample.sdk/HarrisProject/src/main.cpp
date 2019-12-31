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
	int *p;					  // properties of the IMG
	VectorArray100 imgMatrix; // Matrix to storage IMG
	VectorArray3 sobelKernel3x, sobelKernel3y;
//	VectorArray100 imgIx; // Filtered IMG along X
	int temp[100][100];
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
//	displayMatrix3(sobelKernel3x, MSIZE3);
	// initYKernel(sobelKernel3y);

	printf("Creating padded matrix\r\n");
//	padding100(imgMatrix, padMat);

	for (int i = 0; i < 100; i++)
	{

		for (int j = 0; j < 100; j++)
		{
			if (i == 0 || j == 0 || i == 100 || j == 100)
			{
				padMat[i].comp[j] = 0;
			}
			else
			{
				padMat[i].comp[j] = imgMatrix[i - 1].comp[j - 1];
			}
		}
	}

	// displayMatrix100(imgMatrix, MSIZE3);
	 displayMatrix102(padMat, 100);


	// int i;
	// for(i = 0; i<10; i++)
	// {
	// 	int aVal = 1;
	// 	int j;
	// 	for(j = 0; j<10; j++)
	// 	{
	// 		temp[i][j] = aVal;
	// 		aVal++;
	// 	}
	// }

//	printf("X filter\r\n");
//	for (int i = 1; i < 10 - 1; i++)
//	{
//		for (int j = 1; j < 10 - 1; j++)
//		{
//			VectorArray3 mConv;
//			int k;
//			for (k = -1; k < 2; k++)
//			{
//				int l;
//				for (l = -1; l < 2; l++)
//				{
//					mConv[1 + k].comp[1 + l] = (signed int)padMat[i + k].comp[j + l];
//				}
//			}
//
////			temp[i - 1][j - 1] = convUniDirectionSoft(sobelKernel3x, mConv, MSIZE3);
//// 			if (i < 4 && j == 10)
//// 			{
//// //				displayMatrix3(sobelKernel3x, MSIZE3);
//// 				displayMatrix3(mConv, MSIZE3);
//// 				printf("conv: %d \r\n", convUniDirectionSoft(sobelKernel3x, mConv, MSIZE3));
//// 			}
////			temp[i - 1] = convUniDirectionSoft(sobelKernel3x, mConv, MSIZE3);
//			//xil_printf("Convolution result %d, %d is: %d \r\n", i, j, resul);
//		}
//	}

//	displayIntMat100(temp, 20, 20);

	//	displayMatrix100(imgMatrix, MSIZE3);
	// winIxSoft(imgMatrix, padMat , imgIx);
	//	printf("Y filter\r\n");
	//	winIySoft(imgMatrix, imgIy);

	// Display for Testing
	//printf("mat %d\r\n", imgMatrix[1].comp[0]);
	//	displayMatrix100(imgIx, 20);

	return 0;
}
