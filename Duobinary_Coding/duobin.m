clc
clear all

n=input("enter no of bits: ");
bk = [];
for i = 1:n
    b=input("enter bit: ");
    bk=[bk,b];
end

ak = [1]; %assume first value
for i = 1:n
    ak = [ak,xor(ak(i),bk(i))];
end

polar_ak = [];
for i = 1:n+1
    if ak(i) == 1
        polar_ak=[polar_ak,+1];
    else
        polar_ak=[polar_ak,-1];
    end
end

ck = [];
for i = 1:n
    u=polar_ak(i)+polar_ak(i+1);
    ck=[ck,u];
end

bk_decided=[];
for i = 1:n
    if abs(ck(i)) > 1
        bk_decided=[bk_decided,0];
    elseif abs(ck(i)) < 1
        bk_decided=[bk_decided,1];
    end
end


subplot(5,1,1);
stem(bk, linewidth=5, Color='black');
xlabel("Time",fontsize=12)
title("Binary Sequence bk",fontsize=12)

subplot(5,1,2);
stairs(ak, linewidth=5, Color='black');
xlim([1,n+1]);
xlabel("Time",fontsize=12)
title("ak",fontsize=12)

subplot(5,1,3);
stairs(polar_ak, linewidth=5, Color='black');
xlim([1,n+1]);
xlabel("Time",fontsize=12)
title("Polar Representation",fontsize=12)

subplot(5,1,4);
stairs(ck, linewidth=5, Color='black');
xlim([1,n]);
xlabel("Time",fontsize=12)
title("ck",fontsize=12)

subplot(5,1,5);
stem(bk_decided, linewidth=5, Color='black');
xlabel("Time",fontsize=12)
title("Decided bk",fontsize=12)
