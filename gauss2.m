function gaussianFilter = gauss2 (sigma)
n=floor((3.7* sigma)-0.5) ;
size=2*n+ 1;
gaussianFilter=gauss1(size,sigma);
end