function error=compute_infinite_norm_error_2D_t(ana_sol,solution_vector,P,T,Tb_trial,Gauss_type,basis_type,t)

number_of_elements=size(T,2);
max_each_cell=zeros(1,number_of_elements);

for n=1:number_of_elements
    
    vertices=P(:,T(:,n));%Important!
    [Gauss_weights,Gauss_nodes]=generate_Gauss_local_2D(vertices,Gauss_type);
    basis_der_x=0; 
    basis_der_y=0; 
    number_of_local_basis_fun=size(Tb_trial,1);
    
   Gpn=length(Gauss_nodes);%number of Gauss integral points
   diff_in_cell=zeros(1,Gpn);
   uh_local_coefficient_vector=solution_vector(Tb_trial(:,n));%全局解向量中取出单元解向量
    
   for i=1:Gpn
   
    w_ns=local_FE_function_2D(Gauss_nodes(1,i),Gauss_nodes(2,i),uh_local_coefficient_vector,vertices,basis_type,number_of_local_basis_fun,basis_der_x,basis_der_y);
     
    ana_sol_vector=feval(ana_sol,Gauss_nodes(1,i),Gauss_nodes(2,i),t);% value of ith Gauss point of analytic solution in this cell
    diff_in_cell(i)=abs(ana_sol_vector-w_ns);
    end
    max_each_cell(n)=max(diff_in_cell);
end
    error=max(max_each_cell);

    
    