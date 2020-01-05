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
#include <math.h>
#include <algorithm>

int main()
{
	float k_harris = 0.04;
	float k_threhold = 0.01;
	int *p;					  // properties of the IMG
	VectorArray100 imgMatrix; // Matrix to storage IMG
	VectorArray102 padMat;

	VectorArray3 sobelKernel3x, sobelKernel3y;
	VectorFloatArray3 gaussianBlur;
	int i, j;
	// int k;

	// Reading Images
	printf("Reading Image \r\n");
	p = ReadImgProperties((char *)"smiley.bmp");
	ReadImg((char *)"smiley.bmp", p[0], p[4], p[3], p[1], imgMatrix);

	// Sobel filtering
	printf("Initializing filter kernels\r\n");
	sobelKernel3x[0].comp[0] = -1;
	sobelKernel3x[0].comp[1] = 0;
	sobelKernel3x[0].comp[2] = 1;
	sobelKernel3x[1].comp[0] = -2;
	sobelKernel3x[1].comp[1] = 0;
	sobelKernel3x[1].comp[2] = 2;
	sobelKernel3x[2].comp[0] = -1;
	sobelKernel3x[2].comp[1] = 0;
	sobelKernel3x[2].comp[2] = 1;
	// displayMatrix3(sobelKernel3x, MSIZE3);

	sobelKernel3y[0].comp[0] = 1;
	sobelKernel3y[0].comp[1] = 2;
	sobelKernel3y[0].comp[2] = 1;
	sobelKernel3y[1].comp[0] = 0;
	sobelKernel3y[1].comp[1] = 0;
	sobelKernel3y[1].comp[2] = 0;
	sobelKernel3y[2].comp[0] = -1;
	sobelKernel3y[2].comp[1] = -2;
	sobelKernel3y[2].comp[2] = -1;
	// displayMatrix3(sobelKernel3y, MSIZE3);

	gaussianBlur[0].comp[0] = 0.063;
	gaussianBlur[0].comp[1] = 0.125;
	gaussianBlur[0].comp[2] = 0.063;
	gaussianBlur[1].comp[0] = 0.125;
	gaussianBlur[1].comp[1] = 0.25;
	gaussianBlur[1].comp[2] = 0.125;
	gaussianBlur[2].comp[0] = 0.063;
	gaussianBlur[2].comp[1] = 0.125;
	gaussianBlur[2].comp[2] = 0.063;
	// printf("Gaussian Filter\r\n");
	// displayMatrix3(gaussianBlur, MSIZE3);

	printf("Creating padded matrix\r\n");
	padding100(imgMatrix, padMat);
	// displayMatrix102(padMat, 20, 20);

	printf("X Sobel filter\r\n");
	int *imgIx = new int[MSIZE100 * MSIZE100];
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

			*(imgIx + (i - 1) * MSIZE100 + (j - 1)) = convUniDirectionSoft(sobelKernel3x, mConv, MSIZE3);
		}
	}
	// printf("Printing matrix Ix: \r\n");
	// displayMat(imgIx, 20, 20);

	printf("Y Sobel filter\r\n");
	int *imgIy = new int[100 * 100];
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

			*(imgIy + (i - 1) * MSIZE100 + (j - 1)) = convUniDirectionSoft(sobelKernel3y, mConv, MSIZE3);
		}
	}

	// printf("Printing matrix Iy: \r\n");
	// displayMat(imgIy, 20, 20);

	//Matrix multiplication
	printf("Calculation Of Structure Tensor \r\n");
	int32_t *imgIxx = new int32_t[100 * 100];
	int32_t *imgIxy = new int32_t[100 * 100];
	int32_t *imgIyy = new int32_t[100 * 100];

	for (i = 0; i < MSIZE100; i++)
	{
		for (j = 0; j < MSIZE100; j++)
		{
			*(imgIxx + i * MSIZE100 + j) = pow(*(imgIx + i * MSIZE100 + j), 2);
			*(imgIxy + i * MSIZE100 + j) = *(imgIx + i * MSIZE100 + j) * *(imgIy + i * MSIZE100 + j);
			*(imgIyy + i * MSIZE100 + j) = pow(*(imgIy + i * MSIZE100 + j), 2);
		}
	}

	// Display Ixx
	// printf("Ixx: \r\n");
	// displayMat(imgIxx, 20, 20);

	// Display Ixy
	// printf("Ixy: \r\n");
	// displayMat(imgIxy, 20, 20);

	// Display Iyy
	// printf("Iyy: \r\n");
	// displayMat(imgIyy, 20, 20);

	delete imgIx;
	delete imgIy;

	// Apply a Gaussian filter
	printf("Gaussian filtering\r\n");

	int32_t *imgIxxPad = new int32_t[MSIZE102 * MSIZE102];
	int32_t *imgIxyPad = new int32_t[MSIZE102 * MSIZE102];
	int32_t *imgIyyPad = new int32_t[MSIZE102 * MSIZE102];

	// Padding for Gaussian
	for (int i = 0; i < MSIZE102; i++)
	{

		for (int j = 0; j < MSIZE102; j++)
		{
			if (i == 0 || j == 0 || i == MSIZE102 - 1 || j == MSIZE102 - 1)
			{
				*(imgIxxPad + (i)*MSIZE100 + (j)) = 0;
				*(imgIxyPad + (i)*MSIZE100 + (j)) = 0;
				*(imgIyyPad + (i)*MSIZE100 + (j)) = 0;
			}
			else
			{
				*(imgIxxPad + (i)*MSIZE100 + (j)) = *(imgIxx + (i - 1) * MSIZE100 + (j - 1));
				*(imgIxyPad + (i)*MSIZE100 + (j)) = *(imgIxy + (i - 1) * MSIZE100 + (j - 1));
				*(imgIyyPad + (i)*MSIZE100 + (j)) = *(imgIyy + (i - 1) * MSIZE100 + (j - 1));
			}
		}
	}

	// Display Ixx
	// printf("IxxPad: \r\n");
	// displayMat(imgIxxPad, 20, 20);

	// Display Ixy
	// printf("IxyPad: \r\n");
	// displayMat(imgIxyPad, 20, 20);

	// Display Iyy
	// printf("IyyPad: \r\n");
	// displayMat(imgIyyPad, 20, 20);

	delete imgIxx;
	delete imgIxy;
	delete imgIyy;

	double *imgIxxG = new double[100 * 100];
	double *imgIxyG = new double[100 * 100];
	double *imgIyyG = new double[100 * 100];

	for (int i = 1; i < MSIZE102 - 1; i++)
	{
		for (int j = 1; j < MSIZE102 - 1; j++)
		{
			VectorFloatArray3 mConvXX;
			VectorFloatArray3 mConvXY;
			VectorFloatArray3 mConvYY;
			int k;
			for (k = -1; k < 2; k++)
			{
				int l;
				for (l = -1; l < 2; l++)
				{
					mConvXX[1 + k].comp[1 + l] = (double)*(imgIxxPad + (i + k) * MSIZE100 + (j + l));
					mConvXY[1 + k].comp[1 + l] = (double)*(imgIxyPad + (i + k) * MSIZE100 + (j + l));
					mConvYY[1 + k].comp[1 + l] = (double)*(imgIyyPad + (i + k) * MSIZE100 + (j + l));
				}
			}

			*(imgIxxG + (i - 1) * MSIZE100 + (j - 1)) = convUniDirectionSoft(gaussianBlur, mConvXX, MSIZE3);
			*(imgIxyG + (i - 1) * MSIZE100 + (j - 1)) = convUniDirectionSoft(gaussianBlur, mConvXY, MSIZE3);
			*(imgIyyG + (i - 1) * MSIZE100 + (j - 1)) = convUniDirectionSoft(gaussianBlur, mConvYY, MSIZE3);
		}
	}

	delete imgIxxPad;
	delete imgIxyPad;
	delete imgIyyPad;

	// Display Ixx with Gaussian filter
	// printf("Ixx Gaussian: \r\n");
	// displayMat(imgIxxG, 20, 10);

	// Display Ixy with Gaussian filter
	// printf("Ixy Gaussian: \r\n");
	// displayMat(imgIxyG, 20, 10);

	// Display Iyy with Gaussian filter
	// printf("Iyy Gaussian: \r\n");
	// displayMat(imgIyyG, 20, 10);

	//Matrix determinant
	// det = (Ixx * Iyy) - (Ixy**2)

	double *det = new double[100 * 100];
	printf("Determinant: \r\n");

	for (i = 0; i < MSIZE100; i++)
	{
		for (j = 0; j < MSIZE100; j++)
		{
			*(det + i * MSIZE100 + j) = ((double)*(imgIxxG + i * MSIZE100 + j) * (double)*(imgIyyG + i * MSIZE100 + j)) - pow((double)*(imgIxyG + i * MSIZE100 + j), 2);
		}
	}

	// displayMat(det, 20, 10);

	// trace = Ixx + Iyy
	printf("Trace: \r\n");
	long double *trace = new long double[100 * 100];
	for (i = 0; i < MSIZE100; i++)
	{
		for (j = 0; j < MSIZE100; j++)
		{

			*(trace + i * MSIZE100 + j) = (long double)*(imgIxxG + i * MSIZE100 + j) + (long double)*(imgIyyG + i * MSIZE100 + j);

			if (i == 0 && j == 0)
			{
				printf("%f + %f  = %Lf\r\n", *(imgIxxG + i * MSIZE100 + j), *(imgIyyG + i * MSIZE100 + j), *(trace + i * MSIZE100 + j));
			}
		}
	}

	// displayMat(trace, 20, 10);

	delete imgIxxG;
	delete imgIxyG;
	delete imgIyyG;

	// Harris Response
	// r = det - k*(trace**2)
	// k = 0.04
	printf("\n\nHarris Response: \r\n");
	double *trace2 = new double[MSIZE100 * MSIZE100];
	for (i = 0; i < MSIZE100; i++)
	{
		for (j = 0; j < MSIZE100; j++)
		{
			*(trace2 + i * MSIZE100 + j) = k_harris * pow(*(trace + i * MSIZE100 + j), 2);
		}
	}

	// printf("Trace^2:\r\n");
	// displayMat(trace2, 20, 10);

	delete trace;

	double *r = new double[MSIZE100 * MSIZE100];
	for (i = 0; i < MSIZE100; i++)
	{
		for (j = 0; j < MSIZE100; j++)
		{
			*(r + i * MSIZE100 + j) = *(det + i * MSIZE100 + j) - *(trace2 + i * MSIZE100 + j);
		}
	}

	displayMat(r, 20, 10);

	delete det;
	delete trace2;

	// Threshold
	// k= 0.01
	// r > k * max 
	double *max = new double;
	*max = 0;
	for (i = 0; i < MSIZE100; i++)
	{
		for (j = 0; j < MSIZE100; j++)
		{
			if (*(r + i * MSIZE100 + j) > *max)
			{

				*max = *(r + i * MSIZE100 + j);
			}
		}
	}

	printf("\nMax value: %6.1f \r\n", *max);

	int count = 0;

	for (i = 0; i < MSIZE100; i++)
	{
		for (j = 0; j < MSIZE100; j++)
		{
			if (*(r + i * MSIZE100 + j) < k_threhold * *max)
			{

				*(r + i * MSIZE100 + j) = 0;
				count++;
			}
		}
	}

	printf("\n\nThresholded Harris Response: %d corners\r\n", MSIZE100 * MSIZE100 - count);
	displayMat(r, 10, 10);

	WriteData(r, MSIZE100);
	printf("\nCompleted\r\n");

	return 0;
}
