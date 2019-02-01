

%the first problem
% N=11
% f=[-1:0.01:3]
% S=sincperiodic(f,N)
% subplot(211);
% plot(f,S,'LineWidth',2) ;
% grid on;
% xlabel('frequency [ cycles / sample ]');
% ylabel(' sin(\pi fN)/sin(\pi f)');
% subplot(212);
% plot(f,20*log10(abs(S)),'LineWidth',2);
% grid on;
% ylim(20*log10(N) + [-40 0]);
% xlabel(' frequency [ cycles / sample ] ');
% ylabel(' 20 log_ {10}| periodic sinc | dB ');
% orient landscape;
% print -dpng sincperiodicplot.png

%the second problem
% N=11
% f=[-1:0.01:3]
% S=sincperiodic(f,N).*exp(-i*pi*f*10)
% subplot(211);
% plot(f,S,'LineWidth',2) ;
% grid on;
% xlabel('frequency [ cycles / sample ]');
% ylabel(' sin(\pi fN)/sin(\pi f)');
% hold on
% plot(f,imag(S),'LineWidth',2) ;
% grid on;
% xlabel('frequency [ cycles / sample ]');
% ylabel(' sin(\pi fN)/sin(\pi f)');
% hold off
% 
% subplot(212);
% plot(f,20*log10(abs(S)),'LineWidth',2);
% grid on;
% ylim(20*log10(N) + [-40 0]);
% xlabel(' frequency [ cycles / sample ] ');
% ylabel(' 20 log_ {10}| periodic sinc | dB ');
% orient landscape;
% print -dpng sincperiodicplot.png

%the third problem
N=4
f=[-1:0.01:3]
S=sincperiodic(f,N).*exp(i*pi*f*17)
subplot(411);
plot(f,S,'LineWidth',2) ;
grid on;
hold on
plot(f,imag(S),'LineWidth',2) ;
grid on;
xlabel('frequency [ cycles / sample ]');
ylabel(' sin(\pi fN)/sin(\pi f) e^J17');
hold off

subplot(412);
plot(f,20*log10(abs(S)),'LineWidth',2);
grid on;
ylim(20*log10(N) + [-40 0]);
xlabel(' frequency [ cycles / sample ] ');
ylabel(' 20 log_ {10}| periodic sinc | dB ');

N=6
f=[-1:0.01:3]
S=sincperiodic(f,N).*exp(-i*pi*f*15)
subplot(413);
plot(f,S,'LineWidth',2) ;
grid on;
hold on
plot(f,imag(S),'LineWidth',2) ;
grid on;
xlabel('frequency [ cycles / sample ]');
ylabel(' sin(\pi fN)/sin(\pi f) e^-j15');
hold off

subplot(414);
plot(f,20*log10(abs(S)),'LineWidth',2);
grid on;
ylim(20*log10(N) + [-40 0]);
xlabel(' frequency [ cycles / sample ] ');
ylabel(' 20 log_ {10}| periodic sinc | dB ');

orient landscape;
print -dpng sincperiodicplot.png




function y=sincperiodic(x,N)
i=find(mod(x,1)==0);
x(i)=0.5;
y=sin(pi*x*N)./sin(pi*x);
y(i)=N;
end