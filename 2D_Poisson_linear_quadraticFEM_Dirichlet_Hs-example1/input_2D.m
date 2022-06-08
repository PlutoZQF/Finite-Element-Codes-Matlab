clear all
clc

%domain=[left,right]*[bottom,top];
left=-1;
right=1;
bottom=-1;
top=1;
domain=[left,right,bottom,top]
%type of basis functions for trial function 'u', and test function 'v'.
%201 means 2D linear 
%202 means 2D quadratic 
basis_type_trial=202;
basis_type_test=202;

%for Gauss integral in assembling A
%3: 3 points of Gauss quadrature
%4: 4 points of Gauss quadrature
%9: 9 points of Gauss quadrature
%only offer three types of Gauss_type now, enough
Gauss_type=4;

%mesh size h=[h1,h2]=[(right-left)/N1,(top-bottom)/N2];
N1=32
N2=32
h1=(right-left)/N1;
h2=(top-bottom)/N2;


%%%%%%% Choose a norm error type: 1,2,3 or 4
% 1.compute_max_FE_nodes; 2. infinite norm; 3. L2 norm; 4. H1 norm
norm_type=3

% get numerical solution
solution=FE_solver_2D_Poisson(left,right,bottom,top,N1,N2,basis_type_trial,basis_type_test,Gauss_type,norm_type);

%Remember to change the 'generate_boundarynodes' function!



