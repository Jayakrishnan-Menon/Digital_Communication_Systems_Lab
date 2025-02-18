%PN Sequence Generator
clc
clear all
close all
x=[1, 0, 0, 0]; %enter your initial 4 bits here
initialx=x;
disp(x);
PN=[x(end)];
while true
    temp=x(end);
    for i=length(x):-1:2
    x(i)=x(i-1);
    end
    x(1)=xor(x(1),temp);
    if isequal(x,initialx)
        disp(x);
        break
    else
        disp(x);
        PN=[PN, x(end)];
    end
end
stem(PN)
%PN Sequence Generator
clc
clear all
close all
x=[1, 0, 0, 0]; %enter your initial 4 bits here
initialx=x;
disp(x);
PN=[x(end)];
while true
    temp=x(end);
    for i=length(x):-1:2
    x(i)=x(i-1);
    end
    x(1)=xor(x(1),temp);
    if isequal(x,initialx)
        disp(x);
        break
    else
        disp(x);
        PN=[PN, x(end)];
    end
end
stem(PN, "LineWidth",3)
title("Generated PN Sequence","FontSize",20)
xlabel("n-->","FontSize",20)
ylabel("Value","FontSize",20)
title("Generated PN Sequence","FontSize",20)
xlabel("n-->","FontSize",20)
ylabel("Value","FontSize",20)

sprintf("The Generated PN Sequence is: %s",num2str(PN))
