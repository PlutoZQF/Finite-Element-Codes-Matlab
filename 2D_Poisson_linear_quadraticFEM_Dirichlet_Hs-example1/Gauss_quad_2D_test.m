function int_value=Gauss_quad_2D_test(fun_f,Gauss_weights,Gauss_nodes,vertices,basis_type_test,basis_index_test,basis_der_x_test,basis_der_y_test)

Gpn=length(Gauss_nodes);%number of Gauss integral points

int_value=0;

for k=1:Gpn
    int_value=int_value+Gauss_weights(k)*feval(fun_f,Gauss_nodes(1,k),Gauss_nodes(2,k))*FE_basis_local_fun_2D(Gauss_nodes(1,k),Gauss_nodes(2,k),vertices,basis_type_test,basis_index_test,basis_der_x_test,basis_der_y_test);
end