clear all
clc

%domain=[left,right]*[bottom,top];
left=0;
right=2;
bottom=0;
top=1;
domain=[left,right,bottom,top]

%mesh size h=[h1,h2]=[(right-left)/N1,(top-bottom)/N2];
N1=64;
N2=32;
h1=(right-left)/N1
h2=(top-bottom)/N2

%time mesh
start_t=0;
end_t=1;
dt=1/32;
time=[start_t,end_t]

% temporal discretization
% theta=0: forward Euler scheme, 1 order accuracy.
% theta=1: backward Euler scheme, 1 order accuracy.
% theta=1/2: Crank-Nicolson scheme, 2 order accuracy.
theta=1/2

%type of basis functions for trial function 'u', and test function 'v'.
%201 means 2D linear 
%202 means 2D quadratic 
basis_type_trial=201;
basis_type_test=201;

%for Gauss integral in assembling A
%3: 3 points of Gauss quadrature
%4: 4 points of Gauss quadrature
%9: 9 points of Gauss quadrature
%only offer three types of Gauss_type now
Gauss_type=4;


%%%%%%% Choose a norm error type: 1,2,3 or 4
% 1.compute_max_FE_nodes; 2. infinite norm; 3. L2 norm; 4. H1 norm
norm_type=1

% get numerical solution
solution=FE_solver_2D_Heat(start_t,end_t,dt,theta,left,right,bottom,top,N1,N2,basis_type_trial,basis_type_test,Gauss_type,norm_type);

%Remember to change the boundary condition function!!!
