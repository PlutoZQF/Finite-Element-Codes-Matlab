function int_value=Gauss_quad_2D_trial_test(coe_fun,Gauss_weights,Gauss_nodes,vertices,basis_type_test,basis_index_test,basis_der_x_test,basis_der_y_test,basis_type_trial,basis_index_trial,basis_der_x_trial,basis_der_y_trial)

Gpn=length(Gauss_nodes);%number of Gauss integral points
int_value=0;

for k=1:Gpn
    int_value=int_value+Gauss_weights(k)*feval(coe_fun,Gauss_nodes(1,k),Gauss_nodes(2,k))*FE_basis_local_fun_2D(Gauss_nodes(1,k),Gauss_nodes(2,k),vertices,basis_type_test,basis_index_test,basis_der_x_test,basis_der_y_test)*FE_basis_local_fun_2D(Gauss_nodes(1,k),Gauss_nodes(2,k),vertices,basis_type_trial,basis_index_trial,basis_der_x_trial,basis_der_y_trial);
end