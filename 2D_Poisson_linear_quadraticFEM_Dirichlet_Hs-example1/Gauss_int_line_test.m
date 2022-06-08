function int_value=Gauss_int_line_test(Neumann_fun,Gauss_weights_line,Gauss_nodes_line,vertices,basis_type_test,basis_index_test)

%chapter 3; page 96,92-93

Gpn=size(Gauss_nodes_line,2);%number of Gauss integral points

int_value=0;

for k=1:Gpn
    int_value=int_value+Gauss_weights_line(k)*feval(Neumann_fun,Gauss_nodes_line(1,k),Gauss_nodes_line(2,k))*FE_basis_local_fun_2D(Gauss_nodes_line(1,k),Gauss_nodes_line(2,k),vertices,basis_type_test,basis_index_test,0,0);
end