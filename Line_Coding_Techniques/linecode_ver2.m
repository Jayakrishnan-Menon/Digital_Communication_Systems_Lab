clc;
clear all;

bit_len = 100;
m=[1,0,1,0,1,1,0,0,1,0,0,1];

bits = [];
for i=1:length(m)
    if m(i)==1
        bits=[bits, ones(1,bit_len)];
    else
        bits=[bits, zeros(1,bit_len)];
    end
end

URZ = [];
for i=1:length(m)
    if m(i)==1
        URZ=[URZ, ones(1,bit_len/2), zeros(1,bit_len/2)];
    else
        URZ=[URZ, zeros(1,bit_len)];
    end
end

UNRZ = [];
for i=1:length(m)
    if m(i)==1
        UNRZ=[UNRZ, zeros(1,bit_len)];
    else
        UNRZ=[UNRZ, 1*ones(1,bit_len)];
    end
end

BMANCH = [];
for i=1:length(m)
    if m(i)==1
        BMANCH=[BMANCH, 10*ones(1,bit_len/2), (-10)*ones(1,bit_len/2)];
    else
        BMANCH=[BMANCH, (-10)*ones(1,bit_len/2), 10*ones(1,bit_len/2)];
    end
end

BPNRZ = [];
for i=1:length(m)
    if m(i)==1
        BPNRZ=[BPNRZ, 10*ones(1,bit_len)];
    else
        BPNRZ=[BPNRZ, (-10)*ones(1,bit_len)];
    end
end

BPNRZAMI = [];
g = -1;
for i=1:length(m)
    if m(i)==1
      if g==1
          g=-1;
      elseif g==-1
          g=1;
      end
        BPNRZAMI=[BPNRZAMI, g*10*ones(1,bit_len)];
    else
        BPNRZAMI=[BPNRZAMI, zeros(1,bit_len)];
    end
end

QUAT = [];
for i = 1:2:length(m)
    if m(i) == 0 && m(i+1) == 0
        QUAT=[QUAT, -3*ones(1,bit_len)];
    elseif m(i) == 0 && m(i+1) == 1
        QUAT=[QUAT, -1*ones(1,bit_len)];
    elseif m(i) == 1 && m(i+1) == 0
        QUAT=[QUAT, 1*ones(1,bit_len)];
    else
        QUAT=[QUAT, 3*ones(1,bit_len)];
    end
end






subplot(7,1,1);
plot(bits, LineWidth=5, Color="black");
grid on;
title("BITS");
subplot(7,1,2);
plot(URZ, LineWidth=5, Color="black");
grid on;
title("Unipolar RZ");
subplot(7,1,3);
plot(UNRZ, LineWidth=5, Color="black");
grid on;
title("Unipolar NRZ");
subplot(7,1,4);
plot(BMANCH, LineWidth=5, Color="black");
grid on;
title("Biphase/Splitphase Manchester");
subplot(7,1,5);
plot(BPNRZ, LineWidth=5, Color="black");
grid on;
title("Bipolar NRZ");
subplot(7,1,6);
plot(BPNRZAMI, LineWidth=5, Color="black");
grid on;
title("Bipolar NRZ AMI");
subplot(7,1,7);
plot(QUAT, LineWidth=5, Color="black");
grid on;
title("Bipolar Quaternary NRZ");
