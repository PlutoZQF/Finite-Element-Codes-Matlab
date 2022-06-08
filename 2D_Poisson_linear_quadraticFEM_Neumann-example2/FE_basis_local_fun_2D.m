function result=FE_basis_local_fun_2D(x,y,vertices,basis_type,basis_index,basis_der_x,basis_der_y)
%201 : 2D linear
%202 : 2D quadratic
%x,y : value of Gauss_nodes(k) in vertices in each cell
%chapter 2, page 69,70
%vertices=P(:,T(:,n));

xn1=vertices(1,1);
xn2=vertices(1,2);
xn3=vertices(1,3);
yn1=vertices(2,1);
yn2=vertices(2,2);
yn3=vertices(2,3);

J=(xn2-xn1)*(yn3-yn1)-(xn3-xn1)*(yn2-yn1);
xh=((yn3-yn1)*(x-xn1)-(xn3-xn1)*(y-yn1))/J;
yh=(-(yn2-yn1)*(x-xn1)+(xn2-xn1)*(y-yn1))/J;


if basis_der_x==0 && basis_der_y==0
            result=reference_basis_2D(xh,yh,basis_type,basis_index,basis_der_x,basis_der_y);
elseif basis_der_x==1 && basis_der_y==0
            result=((yn3-yn1)/J)*reference_basis_2D(xh,yh,basis_type,basis_index,1,0)+((yn1-yn2)/J)*reference_basis_2D(xh,yh,basis_type,basis_index,0,1);
elseif basis_der_x==0 && basis_der_y==1
            result=((xn1-xn3)/J)*reference_basis_2D(xh,yh,basis_type,basis_index,1,0)+((xn2-xn1)/J)*reference_basis_2D(xh,yh,basis_type,basis_index,0,1);
elseif basis_der_x==2 && basis_der_y==0    
            result=((yn3-yn1)^2)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,2,0)+2*(yn3-yn1)*(yn1-yn2)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,1,1)+((yn1-yn2)^2)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,0,2);
elseif basis_der_x==0 && basis_der_y==2
            result=((xn1-xn3)^2)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,2,0)+2*(xn1-xn3)*(xn2-xn1)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,1,1)+((xn2-xn1)^2)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,0,2);
elseif basis_der_x==1 && basis_der_y==1
            result=(xn1-xn3)*(yn3-yn1)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,2,0)+(xn1-xn3)*(yn1-yn2)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,1,1)+(xn2-xn1)*(yn3-yn1)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,1,1)+(xn2-xn1)*(yn1-yn2)/(J^2)*reference_basis_2D(xh,yh,basis_type,basis_index,0,2);
else
            warning='Wrong basis_der!'
end