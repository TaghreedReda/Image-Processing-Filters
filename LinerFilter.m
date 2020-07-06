function result = LinerFilter(img, fliter, postProcess)
[rs, cs, chs] = size(img);
result = zeros(rs, cs, chs);
for c=1:chs
    result(:,:,c) = Channel(img(:,:,c), fliter, postProcess);
end
result = uint8(result);
end