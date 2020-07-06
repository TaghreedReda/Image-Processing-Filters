function [ResultImg] =Channel(Img, fliter, postProcess)
[RM, CM] = size(Img);
[RF, CF] = size(fliter);

newRowPadding = (floor(RF/2))*2;
newColumPadding = (floor(CF/2))*2;

newRowImg = RM + newRowPadding;
newColumImg = CM + newColumPadding;

NewImg = zeros(newRowImg, newColumImg);

x = (newRowPadding / 2) + 1;
y = (newColumPadding / 2) + 1;

for i=1:1:RM
    for j=1:CM
        NewImg(x,y) = Img(i,j);
        y = y + 1;
    end
    y = (newColumPadding / 2) + 1;
    x = x + 1;
end

  for i=1:RM
    for j=1:CM
        Out(i,j)=sum(sum((NewImg(i:i+RF-1,j:j+CF-1)).*fliter));
    end 
  end

switch postProcess
    case 'cutoff'
        ResultImg = uint8(Out);
        return;
    case 'absolute'
        ResultImg = abs(Out);
        return;
    case 'non'
        ResultImg = Out;
        return;
end
end 

function result = LinerFilter(img, fliter, postProcess)
[rs, cs, chs] = size(img);
result = zeros(rs, cs, chs);
for c=1:chs
    result(:,:,c) = Channel(img(:,:,c), fliter, postProcess);
end
result = uint8(result);
end


function filter=Sobel(mask)

if(mask=='H')
    filter=[-1,-2,-1; 0,0,0; 1,2,1];
    % out=LinerFilter(img,filter,"absolute");
     %out=uint8(out);
end
 if (mask=='V')
         filter=[-1,0,1; -2,0,2; -1,0,1];
         % out=LinerFilter(img,filter,"absolute");
           %out=uint8(out);
    end
    
end

function out = meanmask(rows,cols)
out = ones(rows,cols) /(rows*cols);
end

function filter=laplacian()

filter = [0,-1,0; -1,5,-1; 0,-1,0];
%out=LinerFilter(img,filter,"cutoff");
end


function gaussianFilter = gauss1 (size ,sigma )
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

function gaussianFilter = gauss2 (sigma)
n=floor((3.7* sigma)-0.5) ;
size=2*n+ 1;
gaussianFilter=gauss1(size,sigma);
end
