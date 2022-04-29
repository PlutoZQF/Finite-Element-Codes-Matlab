function b=treat_Neumann_boundary_1D(fun_c,exact_solution_derivative,b,boundarynodes,Pb)
%boundarynodes(1, k)=-1 means Dirichlet boundary node;
%boundarynodes(1, k)=-2 means Neumann boundary node;
%boundarynodes(1, k)=-3 means Robin boundary node.
%boundarynodes(2, k) is the global node index of the kth boundary finite element node.
%boundarynodes(3,k) is the normal direction of the kth boundary node.
for k=1:1:size(boundarynodes,2)
    if boundarynodes(1,k)==-2
        i=boundarynodes(2,k);
        normal_direction=boundarynodes(3,k);
        b(i)=b(i)+normal_direction*feval(fun_c,Pb(i))*feval(exact_solution_derivative,Pb(i));
    end
    end