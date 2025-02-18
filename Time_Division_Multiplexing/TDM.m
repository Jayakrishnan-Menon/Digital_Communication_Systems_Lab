%TDM
clc
clear all
close all
x=20; %plotting limits of x axis
n=500; %number of plot points
t=linspace(0,x,n);
len=length(t);
S1=sin(t);
S2=sawtooth(t,0.5);
S3=square(t);
S(1,:)=S1(:);
S(2,:)=S2(:);
S(3,:)=S3(:);
TDM=reshape(S,1,3*len);
T=linspace(0,x,length(TDM));
%plotting
subplot(511)
stem(t,S1,'r',Marker='.',MarkerSize=10)
title('Sine Wave','FontSize',12)
xlabel('Time','FontSize',12)
ylabel('Amplitude','FontSize',12)
subplot(512)
stem(t,S2,'g',Marker='.',MarkerSize=10)
title('Trianglular Wave','FontSize',12)
xlabel('Time','FontSize',12)
ylabel('Amplitude','FontSize',12)
subplot(513)
stem(t,S3,'b',Marker='.',MarkerSize=10)
title('Square Wave','FontSize',12)
xlabel('Time','FontSize',12)
ylabel('Amplitude','FontSize',12)
subplot(514)
plot(T,TDM)
title('Time Division Multiplexing','FontSize',12)
xlabel('Time','FontSize',12)
ylabel('Amplitude','FontSize',12)
subplot(515)
j=1;
for i=1:length(T)
    if(mod(i,3)==0)
        stem(T(j),TDM(j),'b',Marker='.',MarkerSize=10)
        hold on
    elseif(mod(i,3)==1)
        stem(T(j),TDM(j),'r',Marker='.',MarkerSize=10)
        hold on
    elseif(mod(i,3)==2)
        stem(T(j),TDM(j),'g',Marker='.',MarkerSize=10)
        hold on
    end
    j=j+1;
end
title('De-Multiplexing','FontSize',12)
xlabel('Time','FontSize',12)
ylabel('Amplitude','FontSize',12)
hold off
