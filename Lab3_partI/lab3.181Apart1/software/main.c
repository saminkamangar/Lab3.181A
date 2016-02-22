#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define N	20

volatile int * FPGA_sdram = (int *) 0xC0000000;
volatile int * reg32 = (int *) 0xFF200018;

int compar(const void * a, const void * b)
{
        return (*(int*)a - *(int*)b);
}

void sort(int array[], int size)\
{
        qsort(array, size, sizeof(int), compar);
}

float average(int array[], int size)
{
        int i;
        int total = 0;

        for (i = 0; i < size; i++) {
                total += array[i];
        }

        return (float)total / size;
}

int *randomGen(int size)
{
        int i;

        srand(time(NULL));
        int *array = (int*)malloc(size * sizeof(int*));
        for (i = 0; i < size; i++) {
                //ray[i] = (int)(100.0 * random() / RAND_MAX);
                array[i] = i;
        }

        return array;
}

void print(int array[], int size)
{
        int i;

        for (i = 0; i < size; i++) {
                printf("%d ", array[i]);
        }
        printf("\n");
}



int main(void) {

	char input_str[64];
	int i;
	int read_arr[10];
	int* baseAddr = FPGA_sdram;	// <<<<<<<<<<<<<<<< ??

	while (1) {
		printf("Type 1 or 2 or 3: ");
		scanf("%d", &i);

		if (i == 1) {
			// Part 1
			printf("Enter a number: ");
			scanf("%i", &i);
			(*reg32)= i;

			// Next, send the value to FPGA
			//
			//
			//
			//
		} else if(i == 2) {
			// Part 2
			printf("Type a list of numbers separated by space:\n");
			for (i = 0; i < 10; i++) {
				scanf("%i", &read_arr[i]);
			}

			for (i = 0; i < 10; i++) {
				printf("%i ", read_arr[i]);
				printf("\n");
			}

			// Send 10 numbers to FPGA
			for (i = 0; i < 10; i++) {
				*(baseAddr + i) = read_arr[i];
			}
		} else {
			int i;
			int *randomNumbers = randomGen(N);

			print(randomNumbers, N);

			sort(randomNumbers, N);
			printf("Sorted:\n");
			print(randomNumbers, N);

			printf("Average = %.1f\n", average(randomNumbers, N));

			// Send N numbers to memory
			for (i = 0; i < N; i++) {
				*(baseAddr + i) = read_arr[i];

			}
		}

	}



/*
	volatile int * mem_addr;
	if (!strcmp(input_str, "1")) mem_addr = FPGA_onchip;
	else if (!strcmp(input_str, "2")) mem_addr = FPGA_sdram;
	else if (!strcmp(input_str, "3")) mem_addr = HPS_onchip;
	else mem_addr = HPS_sdram;

	//unsigned int i = 0;
	initCounters();

	// Clear memory
	for (i = 0; i < 8192; i++) {
		(*mem_addr) = 0;
		mem_addr += 1;
		read_arr[i] = 0;
//			read_arr16[i] = 0;
	}
	mem_addr -= 8192;

	printf("Writing to memory...\n");
	unsigned int time = getCycles();
	for (i = 0; i < 8192; i++) {
//			if (!strcmp(input_str,"2")) {
//				(*mem_addr) = write_arr16[i];
//			}
//			else
			(*mem_addr) = write_arr[i];
		mem_addr += 1;
	}

	time = getCycles() - time;
	printf("Elapsed Time: %d cycles\n", time);


	mem_addr -= 8192;
	//unsigned int read_mem;
	printf("Reading from memory...\n");
	time = getCycles();
	for (i = 0; i < 8192; i++) {
//			if (!strcmp(input_str,"2"))  {
//				read_arr16[i] = (*mem_addr);
//				if (read_arr16[i] != write_arr16[i])
//					printf("Incorrect value read. Read %i, expected %i\n", read_arr16[i], write_arr16[i]);
//			}
//			else {
			read_arr[i] = (*mem_addr);
			if (read_arr[i] != write_arr[i])
				printf("Incorrect value read. Read %i, expected %i\n", read_arr[i], write_arr[i]);
//			}
		mem_addr += 1;
	}
	time = getCycles() - time;
	printf("Elapsed Time: %d cycles\n", time);
*/

  return 0;
}

