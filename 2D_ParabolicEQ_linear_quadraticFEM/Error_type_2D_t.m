function error=Error_type_2D_t(norm_type,end_t,solution,Pb,P,T,Tb_trial,Gauss_type,basis_type_trial)

if norm_type==1
    error=compute_max_FE_nodes_2D_t('analytic_solution',solution,Pb,end_t);
elseif norm_type==2
    error=compute_infinite_norm_error_2D_t('analytic_solution',solution,P,T,Tb_trial,Gauss_type,basis_type_trial,end_t);
elseif norm_type==3   
% basis_der_x=alpha1; 
% basis_der_y=alpha2; 
    alpha1=0;
    alpha2=0;
    error=compute_Hs_error_2D_t(alpha1,alpha2,'analytic_solution',solution,P,T,Tb_trial,Gauss_type,basis_type_trial,end_t);
    error=sqrt(error);% it changes from 1D to 2D!
elseif norm_type==4
%chapter 3, page72
    error1=compute_Hs_error_2D_t(1,0,'exact_solution_derivative_x',solution,P,T,Tb_trial,Gauss_type,basis_type_trial,end_t);
    error2=compute_Hs_error_2D_t(0,1,'exact_solution_derivative_y',solution,P,T,Tb_trial,Gauss_type,basis_type_trial,end_t);
    error=sqrt(error1+error2);% it changes from 1D to 2D!
else
    warning='wrong input for error type!'
end