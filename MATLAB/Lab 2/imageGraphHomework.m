%inputImage = 'coloredChips.png';
inputImage = 'liftingbody.png';

%part A
[imageBin, dim] = image2bin(inputImage);
%part B
newImage = bin2image(imageBin, dim);

%part C
% img = imread(newImage);
% imagesc(img)
% axis image
% image(img)

function [y, dim] = image2bin(filename)
outputfilename =  'binaryImage.bin';
imageData = imread(filename) ;

% x = imread(inputImage)
%imagesc(imageData)

r = imageData; r(: ,: ,[2 ,3]) = 0;
g = imageData; g(: ,: ,[1 ,3]) = 0;
b = imageData; b(: ,: ,[1 ,2]) = 0;
dim = [length(r),length(g),length(b)];

binData = cat(3,r,g,b);
binData = uint8(binData);

fileID = fopen(outputfilename,'w' );
fwrite(fileID,binData,'uint8');
fclose(fileID);
y =outputfilename;
end

function y = bin2image(filename, dim)
outputfilename = 'newImage.png';
binfile = fopen(filename,'rb');
if(binfile ==-1) fprintf('ERROR : Could not open file'); end
[rawImageData, cnt] = fread(binfile ,inf ,'uint8'); % read to the end of the file
fclose(binfile);

imagesc(rawImageData);
axis image; % make the pixels square
print -dpng newImage.png;

% r = abs ( real (x) ) ;
% g = abs ( imag (x) ) ;
% b = abs ( real (x) ) ;
% x = cat (3 ,r,g,b) ; % concatenate along the third dimension.

%imagesc(rawImageData)
% imwrite(rawImageData,outputfilename,'PNG');

% image(rawImageData);
% axis image; % make the pixels square
% print -dpng dftmtx_color_matlab.png;
% [nrows ,ncols , nrgb ] = size (x) ;
y = outputfilename;
end