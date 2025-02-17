%FSK
clc
clear all
close all

%Message signal generation
points=1000;
N=10;
subplot(321);
m = rand(1,N);
for i=1:N
if(m(i)>0.5)
    m(i)=1;
    stem(i,m(i),'r','LineWidth',2)
else
    m(i)=0;
    stem(i,m(i),'b','LineWidth',2)
end
hold on
end
title('Binary data bits');
xlabel('n--->');
ylabel('b(n)');
grid on

t = linspace(0,N,N*points);
M1=[];
M2=[];
j=1;
subplot(322);
for i=1:N
    if(m(i)==1)
        M1=[M1,ones(1,1000)];
        M2=[M2,zeros(1,1000)];
        plot(t(j:j+points-1),M1(j:j+points-1),'r','LineWidth',2);
    else
        M1=[M1,zeros(1,1000)];
        M2=[M2,ones(1,1000)];
        plot(t(j:j+points-1),M1(j:j+points-1),'b','LineWidth',2);
    end
    hold on
    j=j+1000;
end
title('message signal');xlabel('t---->');ylabel('m(t)');grid on;hold on;

%Carrier signal generation
fc1 = 5; fc2 = 2;
t = linspace(0,N,N*points);
c1 = sin(2*pi*fc1*t);
c2 = sin(2*pi*fc2*t);
subplot(323); 
plot(t,c1,'r','LineWidth',2);
title('carrier signal-1');xlabel('t---->');ylabel('c1(t)');grid on;
subplot(324); 
plot(t,c2,'b','LineWidth',2);
title('carrier signal-2');xlabel('t---->');ylabel('c2(t)');grid on; 

%FSK
j=1;
FSK=[];
subplot(325);
for i=1:N
    if(m(i)==1)
        FSK=[FSK,c1(j:j+points-1)]; 
        plot(t(j:j+points-1),FSK(j:j+points-1),'r','LineWidth',2)
    else
        FSK=[FSK,c2(j:j+points-1)];
        plot(t(j:j+points-1),FSK(j:j+points-1),'b','LineWidth',2)
    end
    hold on
    j=j+1000;
end
title('FSK signal');xlabel('t---->');ylabel('s(t)');grid on;hold on;

%Demodulation through correlation
DM=[];
j=1;
subplot(326);
for i=1:N
    x1=sum(c1(j:j+points-1).*FSK(j:j+points-1));
    x2=sum(c2(j:j+points-1).*FSK(j:j+points-1));
    x=x1-x2;
    if(x<0)
        DM=[DM,0];
        stem(i,DM(i),'b','LineWidth',2)
    else
        DM=[DM,1];
        stem(i,DM(i),'r','LineWidth',2)
    end
    hold on
    j=j+1000;
end
%Plot demodulated binary bits
title(' demodulated data');xlabel('n---->');ylabel('b(n)'); grid on;
