#include <stdio.h>
#include <string.h>
#include "xil_printf.h"
#include "FileSDCard.h"

#define IMGPIX 11078
#define IMG_SIZE 2
#define IMG_FIRST_DATA 10
#define IMG_WIDTH 18
#define IMG_HEIGHT 22
#define COLOR_PLANES 26


static uint8_t hdr[54];

int counter = 0;

void TestReadImg(void)
{
	int result;
	FileSDCard file((char *)"0:/");

	result = file.mount();
	if (result != XST_SUCCESS)
		printf("Failed to mount SD card\r\n");

	// Open created test file
	result = file.open((char *)"geeks.bmp", FA_OPEN_EXISTING | FA_READ);
	if (result != XST_SUCCESS)
		printf("Failed open file for reading\r\n");

	// Read contents of image file
	result = file.read((void *)hdr, sizeof(hdr), true);
	if (result != XST_SUCCESS)
		printf("Failed reading header from Img\r\n");

	int imgFileSize = hdr[IMG_SIZE] | hdr[IMG_SIZE + 1] << 8 | hdr[IMG_SIZE + 2] << 16 | hdr[IMG_SIZE + 2] << 24;
	printf("Img File Size : %d bytes\n", imgFileSize);

	int initialDataByte = hdr[IMG_FIRST_DATA] | hdr[IMG_FIRST_DATA + 1] << 8 | hdr[IMG_FIRST_DATA + 2] << 16 | hdr[IMG_FIRST_DATA + 2] << 24;
	printf("Initial Data Byte : %d\n", initialDataByte);

	int imgRealSize = imgFileSize - initialDataByte;
	printf("Img Real Size : %d bytes\n", imgRealSize);

	int imgWidth = hdr[IMG_WIDTH] | hdr[IMG_WIDTH + 1] << 8 | hdr[IMG_WIDTH + 2] << 16 | hdr[IMG_WIDTH + 2] << 24;
	printf("Width : %d px\n", imgWidth);

	int imgHeight = hdr[IMG_HEIGHT] | hdr[IMG_HEIGHT + 1] << 8 | hdr[IMG_HEIGHT + 2] << 16 | hdr[IMG_HEIGHT + 2] << 24;
	printf("Height : %d px\n", imgHeight);

	int numColorPlanes = hdr[COLOR_PLANES];
	printf("Number of colors : %d \n", numColorPlanes);

	uint8_t completeHeader[initialDataByte - 1];
	result = file.read((void *)completeHeader, sizeof(completeHeader), true);
	if (result != XST_SUCCESS)
		printf("Failed reading Complete Header\r\n");

	uint8_t readImg[imgRealSize];
	result = file.read((void *)readImg, sizeof(readImg), false);
	if (result != XST_SUCCESS)
		printf("Failed reading image\r\n");

	uint8_t imgMatrix[imgHeight][imgWidth];
	int counter = 0;

//	for (int i = 0; i < 35; i++)
//	{
//		printf("%d: %x\n", i, completeHeader[i]);
//	}

	for (int i = 0; i < imgHeight; i++)
	{
		for (int j = 0; j < imgWidth; j++)
		{
			imgMatrix[i][j] = readImg[counter];
			counter++;
		}
	}
	//	print matrix
	for (int i = 0; i < 10; i++)
	{
		for (int j = 0; j < 20; j++)
		{
			printf("%u ",imgMatrix[i][j]);
		}
		printf("\n");
	}

	result = file.close();
	if (result != XST_SUCCESS)
		printf("Failed closing file\r\n");

}