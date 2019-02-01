i = fopen ( ' infile ' , 'rb' ) ;
ndim = fread (i ,1 , 'int' ) ;
nchan = fread (i ,1 , 'int' ) ;
dim0 = fread (i ,1 , 'int' ) ;
dim1 = fread (i ,1 , 'int' ) ;
dim2 = fread (i ,1 , 'int' ) ;
nsamples = nchan * dim0 *(( dim1 ==0) + dim1 ) *(( dim2 ==0) + dim2 ) ;
x = fread (i, nsamples , 'float' ) ;
if( ndim ==1) % signal
x = reshape (x,nchan, dim0) ;
x = permute (x ,[2 1]) ;
elseif ( ndim ==2) % image
x = reshape (x,nchan ,dim1 , dim0 ) ;
x = permute (x ,[3 2 1]) ;
elseif ( ndim ==3) % video
x = reshape (x,nchan ,dim1 ,dim0 , dim3 ) ;
x = permute (x ,[3 2 1 4]) ;
end
