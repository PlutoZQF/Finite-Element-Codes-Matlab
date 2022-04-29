function b=assemble_vector_1D(fun_f,number_of_elements,basis_type_test,basis_der_x_test,b_vector_size,Tb_test,number_of_local_basis_fun_test,Gauss_type,P,T)

        b=zeros(b_vector_size,1);
        
        for n=1:1:number_of_elements
           
               vertices=P(:,T(:,n));%Important!
               [Gauss_weights,Gauss_nodes]=generate_Gauss_local(vertices,Gauss_type);
            
            for beta=1:number_of_local_basis_fun_test
                
                int_value_b=Gauss_quad_1D_test(fun_f,Gauss_weights,Gauss_nodes,vertices,basis_type_test,beta,basis_der_x_test);
           
                b(Tb_test(beta,n),1)= b(Tb_test(beta,n),1)+int_value_b;
            end
            
        end