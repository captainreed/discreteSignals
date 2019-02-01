T=5
F=[-5:0.01:5]
S=T*sinc(F*T)
subplot(4,1,1);
plot(F,S,'LineWidth',2);
grid on;
xlabel('T=5 Frequency [HZ]');
ylabel('T sinc(FT) ');
subplot(4,1,2);
%
plot(F,20*log10(abs(S)),'LineWidth',2);
grid on;
ylim([-40 0]);
xlabel('Frequency [Hz]');
ylabel('20 log_{10}|T sinc(FT)| dB');
%
T=10
F=[-5:0.01:5]
S=T*sinc(F*T)
subplot(4,1,3)
plot(F,S,'LineWidth',2);
grid on;
xlabel('T=10 Frequency [HZ]');
ylabel('T sinc(FT) ');
%
subplot(4,1,4);
plot(F,20*log10(abs(S)),'LineWidth',2);
grid on;
ylim([-40 0]);
xlabel('Frequency [Hz]');
ylabel('20 log_{10}|T sinc(FT)| dB');
orient landscape;
print -dpng sincplot.png