clear all
clc

%domain: [0,1]
left=0;
right=1;
domain=[left,right]
%type of basis functions for trial function 'u', and test function 'v'.
%101 means 1D linear 
%102 means 1D quadratic 
basis_type_trial=101;
basis_type_test=101;

%for Gauss integral in assembling A
%2: 2 points of Gauss-Legendre quadrature
%3: 3 points of Gauss-Legendre quadrature
%4: 4 points of Gauss-Legendre quadrature
%8: 8 points of Gauss-Legendre quadrature
%only offer four types of Gauss_type now, enough
Gauss_type=8;

%N: number of cell
N=128
h=(right-left)/N;

%%%%%%% Choose a norm error type: 1,2,3 or 4
% 1.compute_max_FE_nodes; 2. infinite norm; 3. L2 norm; 4. H1 norm
norm_type=4

% get numerical solution
solution=FE_solver_1D_Poisson(left,right,h,basis_type_trial,basis_type_test,Gauss_type,norm_type);

%Remember to change the 'generate_boundarynodes' function!



