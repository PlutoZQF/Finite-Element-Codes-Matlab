function [A,b]=treat_Dirichlet_boundary_2D(fun_g,A,b,boundarynodes,Pb)
%Pb is Pb_trial actually.
%boundarynodes(1, k)=-1 means Dirichlet boundary node;
%boundarynodes(1, k)=-2 means Neumann boundary node;
%boundarynodes(1, k)=-3 means Robin boundary node.
%boundarynodes(2, k) is the global node index of the kth boundary finite element node.

for k=1:1:size(boundarynodes,2)
    if boundarynodes(1,k)==-1
        i=boundarynodes(2,k);
        A(i,:)=0;
        A(i,i)=1;
        b(i,1)=feval(fun_g,Pb(1,i),Pb(2,i));  
    end
end