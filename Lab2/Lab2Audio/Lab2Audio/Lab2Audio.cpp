#include <iostream>
#include <fstream>
#include <string>
#include "pch.h"
using namespace std;

typedef struct
{
	int ndim;
	int nchan;
	int dim0;
	int dim1;
	int dim2;
} file_header;

int main() {
	file_header h;
	int headerItem = 0;

	ifstream fin("f1.bin", ios::in | ios::binary);

	if (fin.fail()) {
		cerr << "error opening file" << endl;
	}

	fin.read((char*)&h, sizeof(file_header));
	float *f1data = (float*)calloc(sizeof(float), h.dim0);


	cout << h.ndim << endl;
	cout << h.nchan << endl;
	cout << h.dim0 << endl;
	cout << h.dim1 << endl;
	cout << h.dim2 << endl;

	fin.close();
	while (1);
}

//int main()
//{
//
//
//	//file_header h;
//	//// file input and memory allocation
//	//FILE *i = fopen("f1.bin","rb");
//	//fread(&h, sizeof(file_header), 1, i);
//	//int nsamples = h.nchan*h.dim0*(h.dim1 == 0 ? 1 : h.dim1)*(h.dim2 == 0 ? 1 : h.dim2);
//	//float *x = (float *)calloc(sizeof(float), nsamples);
//	//fread(x, sizeof(float), nsamples, i);
//	//fclose(i);
//	//// file output and memory deallocation
//	//FILE *o = fopen("trial.bin","wb");
//	//fwrite(&h, sizeof(file_header), 1, o);
//	//fwrite(x, sizeof(float), nsamples, o);
//	//fclose(o);
//	//free(x);
//
//	printf("all done");
//}
