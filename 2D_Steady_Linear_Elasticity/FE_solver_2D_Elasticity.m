function solution=FE_solver_2D_Elasticity(left,right,bottom,top,N1,N2,basis_type_trial,basis_type_test,Gauss_type,norm_type)
%basis_type_trial==201: 2D linear
%basis_type_trial==202: 2D quadratic

%%%%%% generating P,T,Pb,Tb, information of basis function (trial and
%%%%%%  test), information of boundary nodes , and the matrix size of
%%%%%%  A and b .
[P,T]=generate_PT_2D(left,right,bottom,top,N1,N2);
[Pb,Tb]=generate_PbTb_2D(basis_type_trial,basis_type_test,P,T,left,right,bottom,top,N1,N2);

number_of_elements=size(T,2);

%for trial function
if basis_type_trial==201
    Pb_trial=Pb;
    Tb_trial=Tb;
    number_of_local_basis_fun_trial=3;
elseif basis_type_trial==202
    Pb_trial=Pb;
    Tb_trial=Tb;
    number_of_local_basis_fun_trial=6;
end

%for test function
if basis_type_test==201
    Pb_test=Pb;
    Tb_test=Tb;
    number_of_local_basis_fun_test=3;
    
elseif basis_type_test==202
    Pb_test=Pb;
    Tb_test=Tb;
    number_of_local_basis_fun_test=6;
end

boundarynodes=generate_boundarynodes(N1,N2,basis_type_trial);
boundaryedges=generate_boundaryedges(N1,N2,T);

matrix_size=[size(Pb_test,2),size(Pb_trial,2)];%==(Nb_test,Nb_trial)
%matrix_size(1)==Nb_test , matrix_size(2)==Nb_trial
%Nb means number of basis functions for trial or test : Nb==size(Pb,2)

b_vector_size=size(Pb_test,2);

%computing A1-A8
%chapter 5, page 23

A1=assemble_matrix_2D('function_lamda',Gauss_type,basis_type_test,basis_type_trial,1,1,0,0,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);
A2=assemble_matrix_2D('function_mu',Gauss_type,basis_type_test,basis_type_trial,1,1,0,0,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);
A3=assemble_matrix_2D('function_mu',Gauss_type,basis_type_test,basis_type_trial,0,0,1,1,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);
A4=assemble_matrix_2D('function_lamda',Gauss_type,basis_type_test,basis_type_trial,0,1,1,0,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);
A5=assemble_matrix_2D('function_mu',Gauss_type,basis_type_test,basis_type_trial,1,0,0,1,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);
A6=assemble_matrix_2D('function_lamda',Gauss_type,basis_type_test,basis_type_trial,1,0,0,1,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);
A7=assemble_matrix_2D('function_mu',Gauss_type,basis_type_test,basis_type_trial,0,1,1,0,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);
A8=assemble_matrix_2D('function_lamda',Gauss_type,basis_type_test,basis_type_trial,0,0,1,1,matrix_size,number_of_elements,P,T,Tb_test,Tb_trial,number_of_local_basis_fun_trial,number_of_local_basis_fun_test);
A=[A1+2*A2+A3 A4+A5;A6+A7 A8+2*A3+A2];

%computing b
b_basis_der_x_test=0;%note: basis_der_x in A and b.
b_basis_der_y_test=0;
b1=assemble_vector_2D('function_f1',number_of_elements,basis_type_test,b_basis_der_x_test,b_basis_der_y_test,b_vector_size,Tb_test,number_of_local_basis_fun_test,Gauss_type,P,T);
b2=assemble_vector_2D('function_f2',number_of_elements,basis_type_test,b_basis_der_x_test,b_basis_der_y_test,b_vector_size,Tb_test,number_of_local_basis_fun_test,Gauss_type,P,T);
b=[b1;b2];

%deal with boundary condition
number_of_unkowns=size(Pb_trial,2);% degree of freedom
[A,b]=treat_Dirichlet_boundary_2D_vector('function_g1','function_g2',number_of_unkowns,A,b,boundarynodes,Pb);

% computing numerical solution
solution=A\b;

error=Error_type_2D_vector(norm_type,solution,Pb,P,T,Tb_trial,Gauss_type,basis_type_trial,number_of_unkowns)


