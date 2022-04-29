function [A,b]=treat_Robin_boundary_1D(fun_c,fun_robin,A,b,boundarynodes,Pb)
%boundarynodes(1, k)=-1 means Dirichlet boundary node;
%boundarynodes(1, k)=-2 means Neumann boundary node;
%boundarynodes(1, k)=-3 means Robin boundary node.
%boundarynodes(2, k) is the global node index of the kth boundary finite element node.
%boundarynodes(3,k) is the normal direction of the kth boundary node.
for k=1:1:size(boundarynodes,2)
    if boundarynodes(1,k)==-3
        i=boundarynodes(2,k);
        normal_direction=boundarynodes(3,k);
        [p,q]=feval(fun_robin);%  p=1;q=1 in example 4;
        b(i)=b(i)+normal_direction*p*feval(fun_c,Pb(i));
        A(i,i)=A(i,i)+normal_direction*q*feval(fun_c,Pb(i));  
    end
end