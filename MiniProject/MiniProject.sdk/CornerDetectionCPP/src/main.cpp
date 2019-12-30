/*
 * main.cpp
 *
 */
#include <stdio.h>

// The hardware must be created with I/O Periherals: SD 0 enabled
// The board support package must be configured with: xilffs (Generic Fat File System Library)
// The application project properties must be modified adding the xilffs library:
// 		Properties -> C/C++ Build -> Settings -> ARM v7 g++ linker -> Inferred Options -> Software Platform
// 		Add: -Wl,--start-group,-lxilffs,-lxil,-lgcc,-lc,--end-group

// void TestFileSDCard(void);

// void TestReadImg(void);


int main()
{
	printf("Demonstration of writing and reading files from SD card\r\n\r\n");
	// TestFileSDCard();
	// TestReadImg();
	return 0;
}