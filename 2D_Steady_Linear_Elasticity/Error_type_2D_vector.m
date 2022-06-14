function error=Error_type_2D_vector(norm_type,solution,Pb,P,T,Tb_trial,Gauss_type,basis_type_trial,number_of_unkowns)

%X=[X1;X2];
solution_X1=solution(1:number_of_unkowns,1);
solution_X2=solution((number_of_unkowns+1):(2*number_of_unkowns),1);


if norm_type==1
    error1=compute_max_FE_nodes_2D('analytic_solution_u1',solution_X1,Pb);
    error2=compute_max_FE_nodes_2D('analytic_solution_u2',solution_X2,Pb);
    error=max(error1,error2);

elseif norm_type==2
%chapter 5, page38
    error1=compute_infinite_norm_error_2D('analytic_solution_u1',solution_X1,P,T,Tb_trial,Gauss_type,basis_type_trial);
    error2=compute_infinite_norm_error_2D('analytic_solution_u2',solution_X2,P,T,Tb_trial,Gauss_type,basis_type_trial);
    error=max(error1,error2);

elseif norm_type==3
%chapter 5, page38
% basis_der_x=alpha1; 
% basis_der_y=alpha2; 
    alpha1=0;
    alpha2=0;
    error1=compute_Hs_error_2D(alpha1,alpha2,'analytic_solution_u1',solution_X1,P,T,Tb_trial,Gauss_type,basis_type_trial);
    error2=compute_Hs_error_2D(alpha1,alpha2,'analytic_solution_u2',solution_X2,P,T,Tb_trial,Gauss_type,basis_type_trial);
    error=sqrt(error1+error2);

elseif norm_type==4
%chapter 5, page39
    error1_u1=compute_Hs_error_2D(1,0,'exact_solution_derivative_x_u1',solution_X1,P,T,Tb_trial,Gauss_type,basis_type_trial);
    error2_u1=compute_Hs_error_2D(0,1,'exact_solution_derivative_y_u1',solution_X1,P,T,Tb_trial,Gauss_type,basis_type_trial);
    error1=error1_u1+error2_u1;
    error1_u2=compute_Hs_error_2D(1,0,'exact_solution_derivative_x_u2',solution_X2,P,T,Tb_trial,Gauss_type,basis_type_trial);
    error2_u2=compute_Hs_error_2D(0,1,'exact_solution_derivative_y_u2',solution_X2,P,T,Tb_trial,Gauss_type,basis_type_trial);
    error2=error1_u2+error2_u2;
    error=sqrt(error1+error2);
else
    warning='wrong input for error type!'
end