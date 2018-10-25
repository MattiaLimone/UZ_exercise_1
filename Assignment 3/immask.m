function S = immask(I , mask)
    R = I(:,:,1) .* uint8(mask);
    G = I(:,:,2) .* uint8(mask);
    B = I(:,:,3) .* uint8(mask); 
   
S= cat(3,R,G,B);
