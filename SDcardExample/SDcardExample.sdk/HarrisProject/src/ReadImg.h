#ifndef READIMG_H_
#define READIMG_H_
#include <stdio.h>
#include <string>
#include "xil_printf.h"
#include <vector>

#include "FileSDCard.h"
#include "Matrices.h"

#define IMGPIX 11078
#define IMG_SIZE 2
#define IMG_FIRST_DATA 10
#define IMG_WIDTH 18
#define IMG_HEIGHT 22
#define COLOR_PLANES 26

static uint8_t hdr[55];

//int * ReadImgProperties(char*);
//uint8_t ReadImg(char*, int, int, int, int);

int * ReadImgProperties(char *name)
{
    // Array containing the properties of the img
    // imgFileSize[0], initialDataByte[1], imgRealSize[2], imgWidth[3], imgHeight[4], numColorPlanes[5]
    static int properties[6];
    int imgFileSize, initialDataByte, imgRealSize, imgWidth, imgHeight, numColorPlanes;

    int result;
	FileSDCard image((char *)"0:/");

    result = image.mount();

	if (result != XST_SUCCESS)
	{
		printf("Failed to mount SD card\r\n");
		return nullptr;
	}

	// Open created test file
	result = image.open(name, FA_OPEN_EXISTING | FA_READ);
	if (result != XST_SUCCESS)
	{
		printf("Failed open file for reading\r\n");
		return nullptr;
	}
    // Read contents of image file
	result = image.read((void *)hdr, sizeof(hdr), true);
	if (result != XST_SUCCESS)
    {
		printf("Failed reading header from Img\r\n");
        return nullptr;
    }
	else
	{
        /*Print properties*/

        imgFileSize = hdr[IMG_SIZE] | hdr[IMG_SIZE + 1] << 8 | hdr[IMG_SIZE + 2] << 16 | hdr[IMG_SIZE + 2] << 24;
        properties[0] = imgFileSize;
        // printf("Img File Size [0] : %d bytes\n", imgFileSize);

        initialDataByte = hdr[IMG_FIRST_DATA] | hdr[IMG_FIRST_DATA + 1] << 8 | hdr[IMG_FIRST_DATA + 2] << 16 | hdr[IMG_FIRST_DATA + 2] << 24;
        properties[1] = initialDataByte;
        // printf("Initial Data Byte [1] : %d\n", initialDataByte);

        imgRealSize = imgFileSize - initialDataByte;
        properties[2] = imgRealSize;
        // printf("Img Real Size [2] : %d bytes\n", imgRealSize);

        imgWidth = hdr[IMG_WIDTH] | hdr[IMG_WIDTH + 1] << 8 | hdr[IMG_WIDTH + 2] << 16 | hdr[IMG_WIDTH + 2] << 24;
        properties[3] = imgWidth;
        // printf("Width [3] : %d px\n", imgWidth);

        imgHeight = hdr[IMG_HEIGHT] | hdr[IMG_HEIGHT + 1] << 8 | hdr[IMG_HEIGHT + 2] << 16 | hdr[IMG_HEIGHT + 2] << 24;
        properties[4] = imgHeight;
        // printf("Height [4] : %d px\n", imgHeight);

        numColorPlanes = hdr[COLOR_PLANES];
        properties[5] = numColorPlanes;
        // printf("Number of colors [5] : %d \n", numColorPlanes);

        return properties;
    
	}

}


void ReadImg(char *name, int imgFlSz,int hgt, int wdt, int iniByte, VectorArray100 imgMatrix)
{
    uint8_t readImg[imgFlSz];
	//uint8_t imgMatrix[hgt][wdt];


    int result;
	FileSDCard image((char *)"0:/");

    result = image.mount();
	if (result != XST_SUCCESS)
	{
		printf("Failed to mount SD card\r\n");
		// return nullptr;
	}

	// Open created test file
	result = image.open(name, FA_OPEN_EXISTING | FA_READ);
	if (result != XST_SUCCESS)
	{
		printf("Failed open file for reading\r\n");
		// return nullptr;
	}

    // Read of the image content
	result = image.read((void *)readImg, iniByte, true); // Read the header
	if (result != XST_SUCCESS)
	{
		printf("Failed reading image header\r\n");
		// return nullptr;
	}
	else
	{
		// Convertion into a matrix (array of arrays)
		for (int i = hgt - 1; i >= 0; i--) // It start from the bottom of the img
		{
			result= image.read((void *)readImg, wdt, false);
			if (result != XST_SUCCESS)
			{
				printf("Failed reading image content\r\n");
				break;
				// return nullptr;
			}
			else
			{
				for (int j = 0; j < wdt; j++)
				{
					imgMatrix[i].comp[j] = readImg[j];
				}
			}
		}

		//	print matrix for testing
//		displayMatrix100(imgMatrix, 100);

	}


	// TODO: Error closing file
	result = image.close();
	if (result != XST_SUCCESS)
	{
		printf("Failed closing file\r\n");
		// return nullptr;
	}
	// else
	// {
	// 	return imgMatrix;
	// }


}

void WriteData(double *matrix, int matSize)
{
	printf("Writing data to a RESULTS file");

	int result;
	FileSDCard file((char*)"0:/");

	char c[20];

	result = file.open((char*)"RESULTb.csv", FA_CREATE_ALWAYS | FA_WRITE);
	if (result != XST_SUCCESS) printf("Failed open file for writing\r\n");

	double counta =0;
	for (int i = 0; i < matSize; i++)
	{
		for (int j = 0; j < matSize; j++)
		{
			// printf(".");
			counta++;
			if(j != matSize - 1) // last of every row
			{
				sprintf(c, "%19.2lf,", *(matrix + i*matSize +j));
			}
			else
			{
				sprintf(c, "%19.2lf\n", *(matrix + i*matSize +j));
			}
			result = file.write((void *)c, sizeof(c) , true);
			if (result != XST_SUCCESS) printf("Failed writing to file\r\n");

		}
	}


	

	result = file.close();
	if (result != XST_SUCCESS) printf("Failed closing file\r\n");
}


#endif /* READIMG_H_ */
