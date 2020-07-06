img=imread('Joker.bmp');
moon=imread('Moon.bmp');

%%%%MeanMask%%%%
figure (1), imshow(LinerFilter(img,meanmask(3,11),"cutoff")),title('Mean Filter 3*11');

%figure (2),imshow(LinerFilter(img,meanmask(15,3),"cutoff")),title('Mean Filter 15*3');

%%%Gaussian 1
%figure (3),imshow(LinerFilter(img,gauss1(15,50),"cutoff")),title('Gauss1');

%%%Gaussian 2
%figure (4),imshow(LinerFilter(img,gauss2(5),"cutoff")),title('Gauss2');

%laplacian
%figure (5),imshow(LinerFilter(moon,laplacian(),"cutoff")),title('Laplacian');

%sobel H
%figure (6),imshow(uint8(LinerFilter(img,Sobel('H',img),"absolute"))),title('Sobel H');

%sobel V
%figure (7),imshow(uint8(LinerFilter(img,Sobel('V',img),"absolute"))),title('Sobel V');

%EdgeMagnit
%figure (8),imshow(EdgeMagnit(img)),title('EdgeMagnit');


