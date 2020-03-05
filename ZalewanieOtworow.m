function [ IbO ] = ZalewanieOtworow( Jw)
  %dylatacja 
       B1 = [1 1 1;
             1 1 1;
             1 1 1];
    Jw = imdilate(Jw,B1);
  % tworzenie obrazu znacznik�w dla rekonstrukcji struktur brze�nych
   marker = false(size(Jw));
   marker(1,:)=1;
   marker(end,:)=1;
   marker(:,1)=1;
   marker(:,end)=1;
    
% wywo�anie funkcji imreconstruct
    R = imreconstruct(marker,~Jw);
    
% wyliczenie obrazu otwor�w
    O = ~Jw-R;
    
% wyliczenie obrazu pozbawionego otwor�w
    IbO = O+Jw;
end

