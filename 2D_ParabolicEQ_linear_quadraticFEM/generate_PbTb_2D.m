function [Pb,Tb]=generate_PbTb_2D(basis_type_trial,basis_type_test,P,T,left,right,bottom,top,N1,N2)
%basis_type_trial=basis_type_test, so only consider basis_type_trial now
%domain=[left,right]*[bottom,top];
%mesh size h=[h1,h2]=[(right-left)/N1,(top-bottom)/N2];

if basis_type_trial==201
Pb=P;
Tb=T;
elseif basis_type_trial==202
    
h1=(right-left)/N1;
h2=(top-bottom)/N2;
Pb=zeros(2,(2*N1+1)*(2*N2+1));
Tb=zeros(6,2*N1*N2);
Qb=zeros(2*N2+1,2*N1+1);%gobal index of FE nodes=[row_node,column_node]

for j=1:(2*N1+1)*(2*N2+1)
    if rem(j,(2*N2+1))==0
        row_node=2*N2+1;
        column_node=fix(j/(2*N2+1));
   elseif fix(j/(2*N2+1))==0
        column_node=1;
        row_node=rem(j,(2*N2+1));
    else
   row_node=rem(j,(2*N2+1));
   column_node=fix(j/(2*N2+1))+1;
    end    
    Pb(1,j)=(column_node-1)*(h1)/2+left;
    Pb(2,j)=(row_node-1)*(h2)/2+bottom;
    Qb(row_node,column_node)=j;% for computing T below
end
    
    
for column_element=1:N1
    for row_element=1:N2
        T_local=zeros(6,2);
        T_local(1,1)=Qb(2*(row_element-1)+1,2*(column_element-1)+1);
        T_local(2,1)=Qb(2*(row_element-1)+1,2*column_element+1);
        T_local(3,1)=Qb(2*row_element+1,2*(column_element-1)+1);
        T_local(4,1)=Qb(2*(row_element-1)+1,2*column_element);
        T_local(5,1)=Qb(2*row_element,2*column_element);
        T_local(6,1)=Qb(2*row_element,2*(column_element-1)+1);
        
        T_local(1,2)=Qb(2*row_element+1,2*column_element-1);
        T_local(2,2)=Qb(2*row_element-1,2*column_element+1);
        T_local(3,2)=Qb(2*row_element+1,2*column_element+1);
        T_local(4,2)=Qb(2*row_element,2*column_element);
        T_local(5,2)=Qb(2*row_element,2*column_element+1);
        T_local(6,2)=Qb(2*row_element+1,2*column_element);
        
        k=(column_element-1)*2*N2+(row_element-1)*2+1;%point to kth and (k+1)th elements
        Tb(:,[k,k+1])=Tb(:,[k,k+1])+T_local;
    end
end
    
end