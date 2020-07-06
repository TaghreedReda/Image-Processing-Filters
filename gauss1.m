function gaussianFilter = gauss1 (size ,sigma )
%img = imread('Joker.bmp');
%doubleimg=double(img);
%padimage=padarray(doubleimg,[1 1],0);
indxStart=floor((-size/2)+1);
gaussianFilter=zeros(size,size);
x=indxStart;
sum =0 ;

for i=1: size;
    y=indxStart;
    for j=1: size;
        
        result = exp(-1*((x)^2+(y)^2)/(2*sigma*sigma));
        out=1/(2*pi*sigma*sigma);
        gaussianFilter (i,j)=out*result ;
        y=y+1;
        sum =sum +gaussianFilter(i,j);
    end
       x=x+1;
     end 
gaussianFilter=double(gaussianFilter*(1/sum));

%i = LinerFilter(padimage,gaussianFilter,"cutoff");

%gaussianFilter=i;
end