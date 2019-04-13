cd 'C:\Users\Brandon\Downloads\discreteSignals-master\discreteSignals-master\Lab5\CA5\CA5'

instant = "instantaneous.bin"
final = "final_product.bin"
hilbert = "hilbert_filter.bin"
gaussian = "gaussian_2_filter.bin"
delay = "delay.bin"

g = bin2audio("firefly.bin", "firefly.wav");
[fireflydata, fs] = audioread("firefly.wav");
nfft = 2^12;
w = hamming(nfft);
overlap = round(0.9*nfft);

spectrogram(fireflydata,w,overlap,nfft,fs,'yaxis','MinThreshold', -60)
hold on
finalData = fopen(finalfile,'rb');
if(finalData ==-1) fprintf('ERROR : Could not open file'); end
[xFinal, cnt2] = fread(finalData, inf, 'float');
last = 10*44100;
xFinal = xFinal(1:last);
y = [0:length(xFinal)-1]/44100;

plot(y,xFinal*7,'k')
ylim([0 2])
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% soundsc(xFinal, 44100)


%Graphs of the hilbret filter
hilbertData = fopen(hilbert,'rb');
if(hilbertData ==-1) fprintf('ERROR : Could not open file'); end

[hilData, cnt4] = fread(hilbertData, inf, 'float');
hd = abs(fft(hilData,2^12));
y = [0:cnt4-1];
figure
subplot(2,1,1)
plot(hd)
hold on
title('Hilbert Filter Magnitude')
hold off
subplot(2,1,2)
plot(angle(hilData))
hold on
title('Hilbert Phase')

%Graphs of the delay filter

delayFile = fopen(delay,'rb');
if(delayFile ==-1) fprintf('ERROR : Could not open file'); end

[delayData, cnt4] = fread(delayFile, inf, 'float');
hd = abs(fft(delayData,2^12));
y = [0:cnt4-1];
figure
subplot(2,1,1)
plot(hd)
hold on
title('Delay Filter Magnitude')
ylim([0 2])
hold off
subplot(2,1,2)
plot(angle(hilData))
hold on
title('Delay Phase')
ylim([-1 4])

%graph of hilbert transformer

instantFile = fopen(instant,'rb');
if(delayFile ==-1) fprintf('ERROR : Could not open file'); end

[instantData, cnt4] = fread(instantFile, inf, 'float');
hd = abs(fft(instantData,2^12));
y = [0:cnt4-1];
figure
subplot(2,1,1)
plot(hd)
hold on
title('Hilbert Transformer Magnitude')
ylim([0 2])
hold off
subplot(2,1,2)
plot(angle(instantData))
hold on
title('Hilbert Transformer Phase')
ylim([-1 4])

%graph of result after gaussian transform

finalFile = fopen(final,'rb');
if(delayFile ==-1) fprintf('ERROR : Could not open file'); end

[finalData, cnt4] = fread(finalFile, inf, 'float');
hd = abs(fft(finalData,2^12));
y = [0:cnt4-1];
figure
subplot(2,1,1)
plot(hd)
hold on
title('Gaussian Combination Magnitude')
ylim([0 2])
hold off
subplot(2,1,2)
plot(angle(finalData))
hold on
title('Gaussian Combination Phase')
ylim([-1 4])
hold off
