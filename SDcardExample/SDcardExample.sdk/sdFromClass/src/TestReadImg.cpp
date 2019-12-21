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

static uint8_t hdr[55];

int counter = 1;

int imgFileSize, initialDataByte, imgRealSize, imgWidth, imgHeight, numColorPlanes;

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

	imgFileSize = hdr[IMG_SIZE] | hdr[IMG_SIZE + 1] << 8 | hdr[IMG_SIZE + 2] << 16 | hdr[IMG_SIZE + 2] << 24;
	printf("Img File Size : %d bytes\n", imgFileSize);

	initialDataByte = hdr[IMG_FIRST_DATA] | hdr[IMG_FIRST_DATA + 1] << 8 | hdr[IMG_FIRST_DATA + 2] << 16 | hdr[IMG_FIRST_DATA + 2] << 24;
	printf("Initial Data Byte : %d\n", initialDataByte);

	imgRealSize = imgFileSize - initialDataByte;
	printf("Img Real Size : %d bytes\n", imgRealSize);

	imgWidth = hdr[IMG_WIDTH] | hdr[IMG_WIDTH + 1] << 8 | hdr[IMG_WIDTH + 2] << 16 | hdr[IMG_WIDTH + 2] << 24;
	printf("Width : %d px\n", imgWidth);

	imgHeight = hdr[IMG_HEIGHT] | hdr[IMG_HEIGHT + 1] << 8 | hdr[IMG_HEIGHT + 2] << 16 | hdr[IMG_HEIGHT + 2] << 24;
	printf("Height : %d px\n", imgHeight);

	numColorPlanes = hdr[COLOR_PLANES];
	printf("Number of colors : %d \n", numColorPlanes);

	// uint8_t completeHeader[initialDataByte - 1];
	uint8_t readImg[imgFileSize];
	uint8_t imgMatrix[imgHeight][imgWidth];

	// Read the complete header to move the position to the initialization of img content
	// result = file.read((void *)completeHeader, sizeof(completeHeader), true);
	// if (result != XST_SUCCESS)
	// 	printf("Failed reading Complete Header\r\n");

	// Read of the image content
	result = file.read((void *)readImg, sizeof(readImg), true);
	if (result != XST_SUCCESS)
		printf("Failed reading image\r\n");

	// Convertion into a matrix (array of arrays)
	counter = initialDataByte;

	int temp = imgWidth; // Holder because variable gets change in middle of the for

	for (int i = imgHeight - 1; i >= 0; i--) // It start from the bottom of the img
	{
		for (int j = 0; j < temp; j++)
		{
			imgMatrix[i][j] = readImg[counter];
			counter++;
		}
	}

	//	print matrix for testing
	for (int i = 0; i < 100; i++)
	{
		for (int j = 0; j < 30; j++)
		{
			printf("%u ", imgMatrix[i][j]);
		}
		printf("\n");
	}
	// TODO: Error closing file
	result = file.close();
	if (result != XST_SUCCESS)
		printf("Failed closing file\r\n");
}
