instant = "instantaneous.bin"
finalfile = "final_product.bin"
hilbert = "hilbert_filter.bin"

instantData = fopen(instant,'rb');
if(instantData ==-1) fprintf('ERROR : Could not open file'); end
[xInstant, cnt1] = fread(instantData, inf, 'float');
y = [0:cnt1-1];
w = hamming(cnt1);
nfft = 2^12;
figure
spectrogram(xInstant,w,length(w)*0.9,nfft)

%FFT of hilbret filter
hilbertData = fopen(hilbert,'rb');
if(hilbertData ==-1) fprintf('ERROR : Could not open file'); end

[hilData, cnt4] = fread(hilbertData, inf, 'float');
hd = fft(hilData);
y = [0:cnt4-1];
figure
plot(y, fftshift(hd))


%plot of output data
finalData = fopen(finalfile,'rb');
if(finalData ==-1) fprintf('ERROR : Could not open file'); end
[xFinal, cnt2] = fread(finalData, inf, 'float');

figure
y = [0:cnt2-1];
plot(y, xFinal)

%soundsc(xFinal, 44100)



