%inputImage = 'coloredChips.png'
inputImage = 'liftingbody.png'
%part A
imageBin = image2bin(inputImage)
%part B
newImage = bin2image(imageBin)

%part C
img = imread(newImage);
image(img)

function y = image2bin(filename)
outputfilename =  'binaryImage.bin'
imageData = imread(filename) ;
fileID = fopen(outputfilename,'w' );
fwrite(fileID,imageData,'uint8');
fclose(fileID);
y =outputfilename;
end

function y = bin2image(filename)
outputfilename = 'newImage.png';
binfile = fopen(filename,'rb');
if(binfile ==-1) fprintf('ERROR : Could not open file'); end
[rawImageData, cnt] = fread(binfile ,inf ,'uint8'); % read to the end of the file
fclose(binfile);
% r = abs ( real (x) ) ;
% g = abs ( imag (x) ) ;
% b = abs ( real (x) ) ;
% x = cat (3 ,r,g,b) ; % concatenate along the third dimension.

imagesc(rawImageData)
% imwrite(rawImageData,outputfilename,'PNG');

% image(rawImageData);
% axis image; % make the pixels square
% print -dpng dftmtx_color_matlab.png;
% [nrows ,ncols , nrgb ] = size (x) ;
y = outputfilename;
end