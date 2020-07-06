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

