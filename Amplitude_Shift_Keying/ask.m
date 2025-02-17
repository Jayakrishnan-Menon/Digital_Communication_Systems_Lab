%ASK
clc
clear all
close all
%Message signal generation
points=1000;
N=20;
m = rand(1,N);
subplot(5,1,1);
for i=1:N
if(m(i)>0.5)
    m(i)=1;
else
    m(i)=0;
end
stem(i, m(i),'LineWidth',2)
hold on
end
title('Binary data bits');
xlabel('n--->');
ylabel('b(n)');
grid on

M=[];
j=1;
subplot(5,1,2);
t = linspace(0,N,N*points);
for i=1:N
    if(m(i)==1)
        M=[M,ones(1,1000)];
    else
        M=[M,zeros(1,1000)];
    end
    plot(t(j:j+points-1),M(j:j+points-1),'LineWidth',2);
    hold on
    j=j+1000;
end
title('Message signal');
xlabel('t--->');
ylabel('m(t)');
grid on
hold on

%Carrier signal generation
fc = 5;
t = linspace(0,N,N*points);
c = sin(2*pi*fc*t);
subplot(5,1,3); 
plot(t,c,'LineWidth',2);
title('Carrier signal');
xlabel('t--->');
ylabel('c(t)');
grid on

%ASK
subplot(5,1,4);
j=1;
for i=1:N
    ASK(j:j+points-1)=M(j:j+points-1).*c(j:j+points-1);
    plot(t(j:j+points-1),ASK(j:j+points-1),'LineWidth',2);
    hold on
    j=j+1000;
end
title('ASK signal');
xlabel('t--->');
ylabel('s(t)');
grid on
hold on

DM=[];
j=1;
subplot(5,1,5);
for i=1:N
    x = sum(c(j:j+points-1).*ASK(j:j+points-1));
    if x==0
        DM=[DM,0];
    else
        DM=[DM,1];
    end
    j=j+1000;
    stem(i,DM(i),'LineWidth',2);
    hold on
end
%Plot demodulated binary bits
title('Demodulated Signal')
xlabel('n--->');
ylabel('b(n)');
grid on
