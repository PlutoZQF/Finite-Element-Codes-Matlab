function boundarynodes=generate_boundarynodes(N_basis)
%boundarynodes(1, k)=-1 means Dirichlet boundary node;
%boundarynodes(1, k)=-2 means Neumann boundary node;
%boundarynodes(1, k)=-3 means Robin boundary node.
%boundarynodes(2, k) is the global node index of the kth boundary finite element node.
boundarynodes(1,1)=-1;
boundarynodes(1,2)=-1;
boundarynodes(2,1)=1;% the 1st FE node index
boundarynodes(2,2)=N_basis;% the last one of FE nodes index
