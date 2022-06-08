function boundarynodes=generate_boundarynodes(N1,N2,basis_type_trial)
%Dirichlet boundary condition at all boundaries in this function
%basis_type_trial=basis_type_test, so only consider basis_type_trial now
%Generate boundary nodes for 2D triangular mesh
%boundarynodes(1, k)=-1 means Dirichlet boundary node;
%boundarynodes(1, k)=-2 means Neumann boundary node;
%boundarynodes(1, k)=-3 means Robin boundary node.
%boundarynodes(2, k) is the global node index of the kth boundary finite element node.

if basis_type_trial==201
    Nb1=N1+1;%number of FE nodes at bottom boundary
    Nb2=N2+1;%number of FE nodes at left boundary

elseif basis_type_trial==202

    Nb1=2*N1+1;%number of FE nodes at bottom boundary
    Nb2=2*N2+1;%number of FE nodes at left boundary
end

boundarynodes=zeros(2,2*((Nb1-1)+(Nb2-1)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dirichlet condition at FE nodes in example2
boundarynodes(1,1)=-1;
boundarynodes(1,Nb1:2*((Nb1-1)+(Nb2-1)))=-1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:Nb1 %bottom boundary
    boundarynodes(2,i)=(i-1)*Nb2+1;
end
for i=(Nb1+1):(Nb1+Nb2-1) %right boundary
    boundarynodes(2,i)=(Nb1-1)*Nb2+(i-(Nb1-1));
end
for i=(Nb1+Nb2):(2*Nb1+Nb2-2) %top boundary
    boundarynodes(2,i)=Nb1*Nb2-(i-(Nb1+Nb2-1))*Nb2;
end
for i=(2*Nb1+Nb2-1):(2*Nb1+2*Nb2-4) %left boundary
    boundarynodes(2,i)=2*Nb1+2*Nb2-2-i;
end
      
    






