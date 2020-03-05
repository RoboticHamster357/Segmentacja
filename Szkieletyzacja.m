function [ Skel ] = Szkieletyzacja( Jw )
  n=5;
  BW = bwmorph(Jw,'skel',n);
  
    B = [1 1];
  
    Skel = imdilate(imerode(BW,B),B);
    
end

