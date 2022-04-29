function error=compute_Hs_error(s,analytic_solution,solution_vector,P,T,Tb_trial,Gauss_type,basis_type)

basis_der_x=s; 
error=0;
number_of_elements=size(T,2);

for n=1:number_of_elements
    vertices=P(:,T(:,n));%Important!
    [Gauss_weights,Gauss_nodes]=generate_Gauss_local(vertices,Gauss_type);

    number_of_local_basis_fun=size(Tb_trial,1);
    uh_local_coefficient_vector=solution_vector(Tb_trial(:,n));%全局解向量中取出单元解向量
    
 
    int_value=Gauss_int_error_1D(analytic_solution,Gauss_weights,Gauss_nodes,uh_local_coefficient_vector,vertices,basis_type,number_of_local_basis_fun,basis_der_x);
    
    error=error+int_value;
end
error=sqrt(error);