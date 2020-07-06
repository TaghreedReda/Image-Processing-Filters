function G = EdgeMagnit(I)
x=LinerFilter(I,Sobel('H'),"absolute");
y=LinerFilter(I,Sobel('V'),"absolute");
G=uint8(x+y);
end

