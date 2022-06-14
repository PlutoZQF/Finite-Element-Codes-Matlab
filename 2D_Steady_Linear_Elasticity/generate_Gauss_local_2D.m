function [Gauss_weights,Gauss_nodes]=generate_Gauss_local_2D(vertices,Gauss_type)
%Gauss_weights_reference:the Gauss coefficients on the reference on the
%reference triangle whose vertices are (0,0),(1,0),(0,1).
%Gauss_nodes_reference:the Gauss points on the reference triangle.
%vertices=P(:,T(:,n));

if Gauss_type==3
    Gauss_weights_reference=[1/6,1/6,1/6];
    Gauss_nodes_reference=[1/2,0;1/2,1/2;0,1/2];
elseif Gauss_type==4
    Gauss_weights_reference=[(1-1/sqrt(3))/8,(1-1/sqrt(3))/8,(1+1/sqrt(3))/8,(1+1/sqrt(3))/8];
    Gauss_nodes_reference=[(1/sqrt(3)+1)/2,(1-1/sqrt(3))*(1+1/sqrt(3))/4;(1/sqrt(3)+1)/2,(1-1/sqrt(3))*(1-1/sqrt(3))/4;(-1/sqrt(3)+1)/2,(1+1/sqrt(3))*(1+1/sqrt(3))/4;(-1/sqrt(3)+1)/2,(1+1/sqrt(3))*(1-1/sqrt(3))/4];
elseif Gauss_type==9
    Gauss_weights_reference=[64/81*(1-0)/8,100/324*(1-sqrt(3/5))/8,100/324*(1-sqrt(3/5))/8,100/324*(1+sqrt(3/5))/8,100/324*(1+sqrt(3/5))/8,40/81*(1-0)/8,40/81*(1-0)/8,40/81*(1-sqrt(3/5))/8,40/81*(1+sqrt(3/5))/8];
    Gauss_nodes_reference=[(1+0)/2,(1-0)*(1+0)/4;(1+sqrt(3/5))/2,(1-sqrt(3/5))*(1+sqrt(3/5))/4;(1+sqrt(3/5))/2,(1-sqrt(3/5))*(1-sqrt(3/5))/4;(1-sqrt(3/5))/2,(1+sqrt(3/5))*(1+sqrt(3/5))/4;(1-sqrt(3/5))/2,(1+sqrt(3/5))*(1-sqrt(3/5))/4;(1+0)/2,(1-0)*(1+sqrt(3/5))/4;(1+0)/2,(1-0)*(1-sqrt(3/5))/4;(1+sqrt(3/5))/2,(1-sqrt(3/5))*(1+0)/4;(1-sqrt(3/5))/2,(1+sqrt(3/5))*(1+0)/4];

end

xn1=vertices(1,1);
xn2=vertices(1,2);
xn3=vertices(1,3);
yn1=vertices(2,1);
yn2=vertices(2,2);
yn3=vertices(2,3);
Jacobi=abs((xn2-xn1)*(yn3-yn1)-(xn3-xn1)*(yn2-yn1));
Gauss_weights=Gauss_weights_reference*Jacobi;
Gauss_nodes(:,1)=xn1+(xn2-xn1)*Gauss_nodes_reference(:,1)+(xn3-xn1)*Gauss_nodes_reference(:,2);
Gauss_nodes(:,2)=yn1+(yn2-yn1)*Gauss_nodes_reference(:,1)+(yn3-yn1)*Gauss_nodes_reference(:,2);
Gauss_nodes=Gauss_nodes';

