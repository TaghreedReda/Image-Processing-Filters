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

