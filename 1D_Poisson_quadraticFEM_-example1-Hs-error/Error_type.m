function error=Error_type(norm_type,solution,Pb,P,T,Tb_trial,Gauss_type,basis_type_trial)

if norm_type==1
    error=compute_max_FE_nodes('analytic_solution',solution,Pb);
elseif norm_type==2
    error=compute_infinite_norm_error('analytic_solution',solution,P,T,Tb_trial,Gauss_type,basis_type_trial);
elseif norm_type==3
    s=0;
    error=compute_Hs_error(s,'analytic_solution',solution,P,T,Tb_trial,Gauss_type,basis_type_trial);
elseif norm_type==4
    s=1;
    error=compute_Hs_error(s,'exact_solution_derivative',solution,P,T,Tb_trial,Gauss_type,basis_type_trial);
else
    warning='wrong input for error type!'
end