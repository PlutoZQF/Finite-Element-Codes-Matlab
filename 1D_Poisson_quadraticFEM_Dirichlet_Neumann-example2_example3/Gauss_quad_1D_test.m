function int_value=Gauss_quad_1D_test(fun_f,Gauss_weights,Gauss_nodes,vertices,basis_type_test,basis_index_test,basis_der_x_test)

Gpn=length(Gauss_nodes);%number of Gauss integral points

int_value=0;

for k=1:Gpn
    int_value=int_value+Gauss_weights(k)*feval(fun_f,Gauss_nodes(k))*FE_basis_local_fun_1D(Gauss_nodes(k),vertices,basis_type_test,basis_index_test,basis_der_x_test);
end