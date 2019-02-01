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

void mono2stereo()
{
	file_header h1;
	file_header h2;

	ifstream fin1("f1.bin", ios::in | ios::binary);

	if (fin1.fail()) {
		cerr << "error opening file" << endl;
	}

	fin1.read((char*)&h1, sizeof(file_header));

	float *f1data = (float*)calloc(sizeof(float), h1.dim0);
	float *f1head = f1data;
	while (!fin1.eof())
	{
		fin1.read((char*)&f1data, sizeof(float));
		f1data++;
	}


	cout << h1.ndim << endl;
	cout << h1.nchan << endl;
	cout << h1.dim0 << endl;
	cout << h1.dim1 << endl;
	cout << h1.dim2 << endl;

	fin1.close();




	ifstream fin2("f2.bin", ios::in | ios::binary);

	if (fin2.fail()) {
		cerr << "error opening file" << endl;
	}

	fin2.read((char*)&h2, sizeof(file_header));
	float *f2data = (float*)calloc(sizeof(float), h1.dim0);
	float *f2head = f2data;
	while (!fin1.eof())
	{
		fin2.read((char*)&f2data, sizeof(float));
		f2data++;
	}

	cout << h2.ndim << endl;
	cout << h2.nchan << endl;
	cout << h2.dim0 << endl;
	cout << h2.dim1 << endl;
	cout << h2.dim2 << endl;

	fin2.close();

	//now f1 head and f2 head are in memory


	//set up the header
	file_header outputHeader;
	outputHeader.ndim = 1;
	outputHeader.nchan = 2;
	outputHeader.dim0 = h1.dim0;
	outputHeader.dim1 = h1.dim1;
	outputHeader.dim2 = 0;

	ofstream fout("2channelout.bin", ios::out | ios::binary);
	fout.write((char*)&outputHeader, sizeof(file_header));

	for (int i = 0; i < h1.dim0; i++)
	{
		fout.write((char*)&f1head, sizeof(float));
		fout.write((char*)&f2head, sizeof(float));
		//cout << f1head << endl;
		f1head++;
		f2head++;
	}
	cout << "finished" << endl;
	fout.close();
}

void color2grey()
{
	file_header h1;
	file_header h2;

	ifstream fin1("binaryImage.bin", ios::in | ios::binary);

	if (fin1.fail()) {
		cerr << "error opening file" << endl;
	}

	fin1.read((char*)&h1, sizeof(file_header));

	float *f1data = (float*)calloc(sizeof(float), h1.dim0);
	float *f1head = f1data;
	while (!fin1.eof())
	{
		fin1.read((char*)&f1data, sizeof(float));
		f1data++;
	}

	cout << h1.ndim << endl;
	cout << h1.nchan << endl;
	cout << h1.dim0 << endl;
	cout << h1.dim1 << endl;
	cout << h1.dim2 << endl;

	fin1.close();


	//now f1 head and f2 head are in memory


	//set up the output header
	file_header outputHeader;
	outputHeader.ndim = 2;
	outputHeader.nchan = 3;
	outputHeader.dim0 = h1.dim0;
	outputHeader.dim1 = h1.dim1;
	outputHeader.dim2 = 0;

	ofstream fout("greyChips.bin", ios::out | ios::binary);
	fout.write((char*)&outputHeader, sizeof(file_header));

	for (int i = 0; i < h1.dim0; i++)
	{
		for (int i = 0; i < h1.dim1; i++)
		{
			for (int i = 0; i < 3; i++)
			{
				switch (i) {
				case 0: *f1head *= 0.2989;
				case 1: *f1head *= 0.5870;
				case 2: *f1head *= 0.1140;
				}
				fout.write((char*)&f1head, sizeof(float));
				f1head++;
			}
		}
	}
	cout << "finished" << endl;
	fout.close();
}

int main() {
	mono2stereo();
	color2grey();

	while (1);
}


