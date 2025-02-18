clc;
clear all;

N=20;
m = rand(1,N);
subplot(5,1,1);
for i=1:N
if(m(i)>0.5)
    m(i)=1;
else
    m(i)=0;
end
end
bit_len = 100; %points
points=bit_len;
t=linspace(0,N,N*points);

bits = [];
j=1;
subplot(7,1,1);
for i=1:length(m)
    if m(i)==1
        bits=[bits, ones(1,bit_len)];
        plot(t(j:j-1+points),bits(j:j-1+points),'r', LineWidth=5);
    else
        bits=[bits, zeros(1,bit_len)];
        plot(t(j:j-1+points),bits(j:j-1+points),'b', LineWidth=5);
    end
    hold on
    j=j+points;
end
grid on;
title("BITS");

subplot(7,1,2);
URZ = [];
j=1;
for i=1:length(m)
    if m(i)==1
        URZ=[URZ, ones(1,bit_len/2), zeros(1,bit_len/2)];
        plot(t(j:j-1+points),URZ(j:j-1+points),'r', LineWidth=5);
    else
        URZ=[URZ, zeros(1,bit_len)];
        plot(t(j:j-1+points),URZ(j:j-1+points),'b', LineWidth=5);
    end
    hold on;
    j=j+points;
end
grid on;
title("Unipolar RZ");

subplot(7,1,3);
UNRZ = [];
j=1;
for i=1:length(m)
    if m(i)==1
        UNRZ=[UNRZ, zeros(1,bit_len)];
        plot(t(j:j-1+points),UNRZ(j:j-1+points),'r', LineWidth=5);
    else
        UNRZ=[UNRZ, 1*ones(1,bit_len)];
        plot(t(j:j-1+points),UNRZ(j:j-1+points),'b', LineWidth=5);
    end
    hold on
    j=j+points;
end
grid on;
title("Unipolar NRZ");

subplot(7,1,4);
BMANCH = [];
j=1;
for i=1:length(m)
    if m(i)==1
        BMANCH=[BMANCH, 10*ones(1,bit_len/2), (-10)*ones(1,bit_len/2)];
        plot(t(j:j-1+points),BMANCH(j:j-1+points),'r', LineWidth=5);
    else
        BMANCH=[BMANCH, (-10)*ones(1,bit_len/2), 10*ones(1,bit_len/2)];
        plot(t(j:j-1+points),BMANCH(j:j-1+points),'b', LineWidth=5);
    end
    hold on
    j=j+points;
end
grid on;
title("Biphase/Splitphase Manchester");

subplot(7,1,5);
BPNRZ = [];
j=1;
for i=1:length(m)
    if m(i)==1
        BPNRZ=[BPNRZ, 10*ones(1,bit_len)];
        plot(t(j:j-1+points),BPNRZ(j:j-1+points),'r', LineWidth=5);
    else
        BPNRZ=[BPNRZ, (-10)*ones(1,bit_len)];
        plot(t(j:j-1+points),BPNRZ(j:j-1+points),'b', LineWidth=5);
    end
    hold on
    j=j+points;
end
grid on;
title("Bipolar NRZ");

subplot(7,1,6);
BPNRZAMI = [];
j=1;
g = -1;
for i=1:length(m)
    if m(i)==1
      if g==1
          g=-1;
      elseif g==-1
          g=1;
      end
        BPNRZAMI=[BPNRZAMI, g*10*ones(1,bit_len)];
        plot(t(j:j-1+points),BPNRZAMI(j:j-1+points),'r', LineWidth=5);
    else
        BPNRZAMI=[BPNRZAMI, zeros(1,bit_len)];
        plot(t(j:j-1+points),BPNRZAMI(j:j-1+points),'b', LineWidth=5);
    end
    hold on
    j=j+points;
end
grid on;
title("Bipolar NRZ AMI");

subplot(7,1,7);
QUAT = [];
j=1;
for i = 1:2:length(m)
    if m(i) == 0 && m(i+1) == 0
        QUAT=[QUAT, -3*ones(1,bit_len)];
        plot(t(j:j-1+points),QUAT(j:j-1+points),'r', LineWidth=5);
    elseif m(i) == 0 && m(i+1) == 1
        QUAT=[QUAT, -1*ones(1,bit_len)];
        plot(t(j:j-1+points),QUAT(j:j-1+points),'r', LineWidth=5);
    elseif m(i) == 1 && m(i+1) == 0
        QUAT=[QUAT, 1*ones(1,bit_len)];
        plot(t(j:j-1+points),QUAT(j:j-1+points),'r', LineWidth=5);
    else
        QUAT=[QUAT, 3*ones(1,bit_len)];
        plot(t(j:j-1+points),QUAT(j:j-1+points),'r', LineWidth=5);
    end
    hold on
    j=j+points;
end
grid on;
title("Bipolar Quaternary NRZ");
