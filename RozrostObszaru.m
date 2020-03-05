function [ Jw ] = RozrostObszaru( s,J,max_dJ)
    

    Jd=double(J); 
    [w,k]=size(J);                                                  


% Inicjalizacja            
    l_pix=0;                    
    Jw=false(w,k);              
    maska=false(w,k);          
    kolejka=s;              
    Jsr=Jd(s(1),s(2));        

% Procedura rozrostu obszaru
    tic;
    while (~isempty(kolejka))                   
        c=kolejka(1,:);                         
        kolejka=kolejka(2:size(kolejka,1),:);  
        if (~maska(c(1),c(2)))                 
            maska(c(1),c(2))=true;              
            if (abs(Jd(c(1),c(2))-Jsr)<=max_dJ)
                Jw(c(1),c(2))=true;            
                sasiedzi=IndeksySasiadow(c,w,k);       
                kolejka=[   kolejka;
                            sasiedzi];         

                l_pix=l_pix+1;                
            end
        end
    end
    tic;
    
Jw=zeros(size(Jw));
Jw(Jd(s(1),s(2))-max_dJ<=Jd&Jd(s(1),s(2))+max_dJ>=Jd)=1;
Jw=bwselect(Jw,s(2),s(1));
     
end

