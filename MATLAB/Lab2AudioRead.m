%filename = 'flute22.wav' %put the file path inside these quotes
f1name = 'f1.wav'
f2name = 'f2.wav'

ai = audioinfo(f1name) ;
disp(ai)% display audio header structure

ai = audioinfo(f2name) ;
disp(ai)% display audio header structure

f1Bin = audio2bin(f1name, ai.SampleRate, 'f1.bin')
f2Bin = audio2bin(f2name, ai.SampleRate, 'f2.bin')


function y = audio2bin(filename, samplerate, outputFileName)
ai = audioinfo(filename);
[audioData, fs] = audioread(filename);
outputfilename = outputFileName
disp(outputfilename)
fileID = fopen( outputfilename,'w' );

disp("dimensions")
ndim = int32(1)
fwrite(fileID,ndim,'int32');

disp("channels")
nchan = int32(ai.NumChannels)
fwrite(fileID,nchan,'int32');

dim0 = int32(length(audioData))
fwrite(fileID,dim0,'int32');

dim1 = int32(ai.SampleRate)
fwrite(fileID,dim1,'int32');

dim2 = int32(0)
fwrite(fileID,dim2,'int32');

disp("file size")
length(audioData)

fwrite(fileID,audioData,'float');
fclose(fileID);
y =outputfilename;
end



Lab2/Lab2Audio/.vs/Lab2Audio/v15/Browse.VC.opendb




% i = fopen ( ' infile ' , 'rb' ) ;
% ndim = fread (i ,1 , 'int' ) ;
% nchan = fread (i ,1 , 'int' ) ;
% dim0 = fread (i ,1 , 'int' ) ;
% dim1 = fread (i ,1 , 'int' ) ;
% dim2 = fread (i ,1 , 'int' ) ;
% nsamples = nchan * dim0 *(( dim1 ==0) + dim1 ) *(( dim2 ==0) + dim2 ) ;
% x = fread (i, nsamples , 'float' ) ;
% if( ndim ==1) % signal
% x = reshape (x,nchan, dim0) ;
% x = permute (x ,[2 1]) ;
% elseif ( ndim ==2) % image
% x = reshape (x,nchan ,dim1 , dim0 ) ;
% x = permute (x ,[3 2 1]) ;
% elseif ( ndim ==3) % video
% x = reshape (x,nchan ,dim1 ,dim0 , dim3 ) ;
% x = permute (x ,[3 2 1 4]) ;
% end
