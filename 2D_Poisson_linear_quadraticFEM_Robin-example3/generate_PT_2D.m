function [P,T]=generate_PT_2D(left,right,bottom,top,N1,N2)
%this function is for a general uniform rectangular mesh
%domain=[left,right]*[bottom,top];
%mesh size h=[h1,h2]=[(right-left)/N1,(top-bottom)/N2];

h1=(right-left)/N1;
h2=(top-bottom)/N2;
P=zeros(2,(N1+1)*(N2+1));
T=zeros(3,2*N1*N2);
Q=zeros(N2+1,N1+1);%gobal index of mesh nodes=[row_node,column_node]

for j=1:(N1+1)*(N2+1)
    if rem(j,(N2+1))==0
        row_node=N2+1;
        column_node=fix(j/(N2+1));
    elseif fix(j/(N2+1))==0
        column_node=1;
        row_node=rem(j,(N2+1));
    else
   row_node=rem(j,(N2+1));
   column_node=fix(j/(N2+1))+1;
    end
    P(1,j)=(column_node-1)*h1+left;
    P(2,j)=(row_node-1)*h2+bottom;
    Q(row_node,column_node)=j;% for computing T below
end

for column_element=1:N1
    for row_element=1:N2
        T_local=zeros(3,2);
        T_local(1,1)=Q(row_element,column_element);
        T_local(2,1)=Q(row_element,column_element+1);
        T_local(3,1)=Q(row_element+1,column_element);
        T_local(1,2)=Q(row_element+1,column_element);
        T_local(2,2)=Q(row_element,column_element+1);
        T_local(3,2)=Q(row_element+1,column_element+1);
        k=(column_element-1)*2*N2+(row_element-1)*2+1;%point to kth and (k+1)th elements
        T(:,[k,k+1])=T(:,[k,k+1])+T_local;
    end
end