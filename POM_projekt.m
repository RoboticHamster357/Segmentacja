%% Wczytywanie obrazów
J={};
j=1;
for i=350:489
    nazwa_pliku=sprintf('SE000005/CT%06d',i);
    J{j}=dicomread(nazwa_pliku);
    j=j+1;
end

for i=1:140
    J{i}=uint16(J{i});
end
%% Wybór punktu startowego
figure
imshow(J{140},'DisplayRange',[]);
[x,y]=getpts;

     
x=round(x);
y=round(y);
s=[y,x]
%% Inicjalizacja zmiennych
Wysegmentowany={};
Szkielet={};
BezOtworow={};
Pola={};
Roznica={};
max_dJ=1150;

%% Segmentacja obrazów
Wysegmentowany{1}=RozrostObszaru(s,J{140},max_dJ);
Szkielet{1}=Szkieletyzacja(Wysegmentowany{1});
BezOtworow{1}=ZalewanieOtworow(Wysegmentowany{1});
[X,Y] = find(Szkielet{1}==1);
s=[X(1),Y(1)];
j=2;
k=1;

for i=139:-1:1
    [X,Y] = find(Szkielet{j-1}==1);
    iloscPunktow=length(X);
    Roznica=zeros(size(X));
    maxJasnosc=0;
    for k=1:iloscPunktow
        punkt=[X(k),Y(k)];
        jasnosc=J{i}(punkt(1),punkt(2));
        if(jasnosc>maxJasnosc)
            maxJasnosc=jasnosc;
            s=punkt;
        end
    end
        Wysegmentowany{j}=RozrostObszaru(s,J{i},max_dJ);
        Szkielet{j}=Szkieletyzacja(Wysegmentowany{j});
        BezOtworow{j}=ZalewanieOtworow(Wysegmentowany{j});
        
        if j>85&&j<=95
            max_dJ=850;
        elseif j>95&&j<=98
            max_dJ=550;
        elseif j>98&&j<=102
            max_dJ=650;
        elseif j>102&&j<=103
            max_dJ=800;
        elseif j>103&&j<=104
            max_dJ=550;
        elseif j>104&&j<=105
            max_dJ=700;
        elseif j>105&&j<=106
            max_dJ=600;
        elseif j>106&&j<=107
            max_dJ=750;
        elseif j>107&&j<=111
            max_dJ=620;
        elseif j>111&&j<=112
            max_dJ=750;
        elseif j>112
            max_dJ=620;
        end
        j=j+1;

        pause(0.1);
end

%% Model 3D
for i=1:140
    I(:,:,i)=BezOtworow{i};
end
imshow3D(I,[]);