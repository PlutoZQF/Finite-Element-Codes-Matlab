function int_value=Gauss_int_error_2D_t(analytic_solution,t,Gauss_weights,Gauss_nodes,uh_local_vector,vertices,basis_type,number_of_local_basis_fun,basis_der_x,basis_der_y)

Gpn=length(Gauss_nodes);%number of Gauss integral points
int_value=0;

for k=1:Gpn
    int_value=int_value+Gauss_weights(k)*(feval(analytic_solution,Gauss_nodes(1,k),Gauss_nodes(2,k),t)-local_FE_function_2D(Gauss_nodes(1,k),Gauss_nodes(2,k),uh_local_vector,vertices,basis_type,number_of_local_basis_fun,basis_der_x,basis_der_y))^2;
end
