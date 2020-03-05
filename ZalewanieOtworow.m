function [ IbO ] = ZalewanieOtworow( Jw)
  %dylatacja 
       B1 = [1 1 1;
             1 1 1;
             1 1 1];
    Jw = imdilate(Jw,B1);
  % tworzenie obrazu znaczników dla rekonstrukcji struktur brze¿nych
   marker = false(size(Jw));
   marker(1,:)=1;
   marker(end,:)=1;
   marker(:,1)=1;
   marker(:,end)=1;
    
% wywo³anie funkcji imreconstruct
    R = imreconstruct(marker,~Jw);
    
% wyliczenie obrazu otworów
    O = ~Jw-R;
    
% wyliczenie obrazu pozbawionego otworów
    IbO = O+Jw;
end

