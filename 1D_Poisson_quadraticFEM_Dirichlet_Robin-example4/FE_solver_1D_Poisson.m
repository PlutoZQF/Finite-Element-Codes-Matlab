function solution=FE_solver_1D_Poisson(left,right,h,basis_type_trial,basis_type_test,Gauss_type)
%basis_type_trial==101: 1D linear
%basis_type_trial==102: 1D quadratic

%%%%%% generating P,T,Pb,Tb, information of basis function (trial and
%%%%%%  test), information of boundary nodes , and the matrix size of
%%%%%%  A and b .

%for 1D linear, generating P,T,Pb,Tb.
%[P,T]=generate_PT;
P=left:h:right;
for k=1:1:(right-left)/h
    T(:,k)=[k;k+1];
end
[Pb,Tb]=generate_PbTb(basis_type_trial,basis_type_test,P,T,left,right,h);


number_of_elements=size(T,2);

%for trial function
if basis_type_trial==101
    Pb_trial=Pb;
    Tb_trial=Tb;
    number_of_local_basis_fun_trial=2;
 %number_of_local_basis_fun=Nlb=size(Tb,1)
 %for 101, Nlb=length(alpha;beta)=2
    
elseif basis_type_trial==102
    Pb_trial=Pb;
    Tb_trial=Tb;
    number_of_local_basis_fun_trial=3;
else
    warning='Under construction for 103 !'
end

%for test function
if basis_type_test==101
    Pb_test=Pb;
    Tb_test=Tb;
    number_of_local_basis_fun_test=2;
    
elseif basis_type_test==102
    Pb_test=Pb;
    Tb_test=Tb;
    number_of_local_basis_fun_test=3;
else
    warning='Under construction for 103 !'
end


N_basis=size(Pb_test,2);%number of FE nodes
boundarynodes=generate_boundarynodes(N_basis);

matrix_size=[size(Pb_test,2),size(Pb_trial,2)];%==(Nb_test,Nb_trial)
%matrix_size(1)==Nb_test , matrix_size(2)==Nb_trial
%Nb means number of basis functions for trial or test : Nb==size(Pb,2)

b_vector_size=size(Pb_test,2);

%computing A
A_basis_der_x_trial=1;
A_basis_der_x_test=1;
A=assemble_matrix_1D('function_c',Gauss_type,basis_type_test,basis_type_trial,A_basis_der_x_test,A_basis_der_x_trial,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);

%computing b
b_basis_der_x_test=0;%note: basis_der_x in A and b.
b=assemble_vector_1D('function_f',number_of_elements,basis_type_test,b_basis_der_x_test,b_vector_size,Tb_test,number_of_local_basis_fun_test,Gauss_type,P,T);

% deal with boundary condition
[A,b]=treat_Dirichlet_boundary_1D('function_g',A,b,boundarynodes,Pb);
b=treat_Neumann_boundary_1D('function_c','exact_solution_derivative',b,boundarynodes,Pb);
[A,b]=treat_Robin_boundary_1D('function_c','function_robin',A,b,boundarynodes,Pb);

% computing numerical solution
solution=A\b

error=compute_max_FE_nodes('analytic_solution',solution,Pb)