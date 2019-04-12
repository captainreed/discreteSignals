#ifndef BIN_FILE_HEADER
#define BIN_FILE_HEADER

typedef struct
{
    int ndim;
    // signal (1)
    // image  (2)
    // video  (3)
    int nchan;
    //signal (1=mono, 2=stereo, etc.)
    //grayscale image/video (1)
    //color image/video (3)
    int dim0;
    //signal -> length
    //image or video -> number rows
    int dim1;
    //signal -> if audio, then dim1 = sample rate
    //image or vid -> number columns
    int dim2;
    //signal -> 0
    //image  -> 0
    //video -> number of frames
} dsp_file_header;

#endif
