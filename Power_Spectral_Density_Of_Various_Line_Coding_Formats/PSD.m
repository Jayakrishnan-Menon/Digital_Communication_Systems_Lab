clc
clear all
n=input("freq lim ");
V=input("Voltage val ");
Tb=input("Time ");
f=linspace(0,n,n^10);

y1 = (((V^2)*Tb)/2)*((sinc(f*Tb)).^2) + (((V^2)*Tb)/4)*((sinc(f*Tb)).^2); %UNRZ
plot(f,y1,linewidth=3,col="black");
hold on;

y2 = (V^2)*Tb*((sinc(f*Tb)).^2); %Polar NRZ
plot(f,y2,linewidth=3,col="red");
hold on;

y3 = ((V^2)*Tb*((sinc(f*Tb)).^2)).*(((sin(pi*f*Tb)).^2)); %BPNRZ
plot(f,y3,linewidth=3,col="green");
hold on;

y4 = ((V^2)*Tb*((sinc([f*Tb]./2)).^2)).*(((sin([pi*f*Tb]./2)).^2)); %MANCH
plot(f,y4,linewidth=3,col="blue");

legend('Unipolar NRZ','Polar NRZ','Bipolar NRZ','Manchester');
ylabel("Power Spectral Density");
xlabel("Frequency");
title("PSD for Various binary line codes");
set(gca,'FontSize',30,'fontWeight','bold')
grid on;
hold off;
