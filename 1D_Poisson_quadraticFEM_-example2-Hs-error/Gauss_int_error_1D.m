function int_value=Gauss_int_error_1D(analytic_solution,Gauss_weights,Gauss_nodes,uh_local_vector,vertices,basis_type,number_of_local_basis_fun,basis_der_x)

Gpn=length(Gauss_nodes);%number of Gauss integral points
int_value=0;

for k=1:Gpn
    int_value=int_value+Gauss_weights(k)*(feval(analytic_solution,Gauss_nodes(k))-local_FE_function_1D(Gauss_nodes(k),uh_local_vector,vertices,basis_type,number_of_local_basis_fun,basis_der_x))^2;
end
