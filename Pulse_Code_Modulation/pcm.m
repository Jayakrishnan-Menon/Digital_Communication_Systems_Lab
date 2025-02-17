clc
clear all
close all
fm = input('enter the vaues of frequency fm: ');
A = input('enter amplitude: ');
l = input('enter the no of samples to be taken per cycle: ');
n = input('enter no of PCM bits: ');
d = input('enter time limit to display the graph: ');

subplot(311)
t=linspace(0,d,(d+1)^5);
x = A*sin(2*pi*fm*t);                        %plotting the sine function
plot(t,x,'r','linewidth',3)
title('Input Sine Wave','fontsize',10);
ylabel('Amplitude');
xlabel('time t');

subplot(312)
fs=l*fm;                                     %sample frequency of DAC
Ts=1/fs;                                     %sample interval  
t=0:Ts:d;                                    %create vector till d, with step size sample interval Ts
x = A*sin(2*pi*fm*t);                        %generate the sampled sine wave
stem(t,x,'g','linewidth',3)                  %plot the sampled sine wave
title('Sampled Sine Wave','fontsize',10);
ylabel('Amplitude');
xlabel('time t');

subplot(313)
D=double(dec2bin(x,n))-48;                   %convert the samples values into binary
b=[];
for i=1:length(D(:,1))
    b=[b,D(i,:)];                            %create binary array
end
t=linspace(0,d,length(b));
stairs(t, b,'b','linewidth',3);              %plot the PCM signal
title('PCM Output','fontsize',10);
ylabel('Amplitude');
xlabel('time t');
