function result=local_FE_function_2D(x,y,uh_local_vector,vertices,basis_type,number_of_local_basis_fun,basis_der_x,basis_der_y)
result=0;

for k=1:number_of_local_basis_fun
    
    result=result+uh_local_vector(k)*FE_basis_local_fun_2D(x,y,vertices,basis_type,k,basis_der_x,basis_der_y);

end