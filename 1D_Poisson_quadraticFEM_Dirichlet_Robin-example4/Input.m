clear all
clc

%domain: [0,1]
left=0;
right=1;
domain=[left,right]
%type of basis functions for trial function 'u', and test function 'v'.
%101 means 1D linear 
%102 means 1D quadratic 
basis_type_trial=102;
basis_type_test=102;

%for Gauss integral in assembling A
%2: 2 points of Gauss-Legendre quadrature
%3: 3 points of Gauss-Legendre quadrature
%4: 4 points of Gauss-Legendre quadrature
%8: 8 points of Gauss-Legendre quadrature
%only offer four types of Gauss_type now, enough
Gauss_type=4;

%N: number of cell
N=8
h=(right-left)/N;

% get numerical solution
solution=FE_solver_1D_Poisson(left,right,h,basis_type_trial,basis_type_test,Gauss_type);



