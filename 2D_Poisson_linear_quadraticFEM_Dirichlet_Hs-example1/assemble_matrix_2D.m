function A=assemble_matrix_2D(coe_fun,Gauss_type,basis_type_test,basis_type_trial,basis_der_x_test,basis_der_x_trial,basis_der_y_test,basis_der_y_trial,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test)

A=sparse(matrix_size(1),matrix_size(2));
% matrix_size(1)==Nb_test , matrix_size(2)==Nb_trial
% sparse~zores


for n=1:number_of_elements
    
    vertices=P(:,T(:,n));%Important!
    [Gauss_weights,Gauss_nodes]=generate_Gauss_local_2D(vertices,Gauss_type);
    
    for alpha=1:number_of_local_basis_fun_trial
         for beta=1:number_of_local_basis_fun_test
             
             int_value=Gauss_quad_2D_trial_test(coe_fun,Gauss_weights,Gauss_nodes,vertices,basis_type_test,beta,basis_der_x_test,basis_der_y_test,basis_type_trial,alpha,basis_der_x_trial,basis_der_y_trial);
    %basis_index_trial==alpha, basis_index_test==beta
             i=Tb_test(beta,n);%Important!
             j=Tb_trial(alpha,n);%Important!
             A(i,j)=A(i,j)+int_value;
             
             
         end
    end
end