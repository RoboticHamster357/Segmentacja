function [sasiedzi]=IndeksySasiadow(c,w,k)


        sasiedzi=[  c(1)-1,c(2)-1;  c(1)-1,c(2);    c(1)-1,c(2)+1;
                    c(1),c(2)-1;                    c(1),c(2)+1;
                    c(1)+1,c(2)-1;  c(1)+1,c(2);    c(1)+1,c(2)+1];

ind_OK=find( (sasiedzi(:,1)>0) & (sasiedzi(:,1)<=w) & (sasiedzi(:,2)>0) & (sasiedzi(:,2)<=k) );
sasiedzi=sasiedzi(ind_OK,:);