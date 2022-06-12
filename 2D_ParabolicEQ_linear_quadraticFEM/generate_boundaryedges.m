function boundaryedges=generate_boundaryedges(N1,N2,T)
%Generate boundary edges for 2D triangular mesh
%Dirichlet (-1), Neumann (-2), Robin (-3)

boundaryedges=zeros(4,2*(N1+N2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Neumann condition at boundary edges in example3
boundaryedges(1,1:N1)=-3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for n=1:N1 %bottom boundary
    boundaryedges(2,n)=2*N2*(n-1)+1;%cell index
    boundaryedges(3,n)=T(1,boundaryedges(2,n));%1st local index in a cell
    boundaryedges(4,n)=T(2,boundaryedges(2,n));%2st local index in a cell   
end

for n=(N1+1):(N1+N2) %right boundary
    if n==N1+1
    boundaryedges(2,n)=(N1-1)*N2*2+2;%cell index
    else
    boundaryedges(2,n)=(n-(N1+1))*2+boundaryedges(2,N1+1);
    end
    boundaryedges(3,n)=T(2,boundaryedges(2,n));%2st local index in a cell
    boundaryedges(4,n)=T(3,boundaryedges(2,n));%3st local index in a cell   
end

for n=(N1+N2+1):(2*N1+N2) %top boundary
    if n==N1+N2+1
    boundaryedges(2,n)=boundaryedges(2,N1+N2);%cell index
    else
    boundaryedges(2,n)=-(n-(N1+N2+1))*2*N2+boundaryedges(2,N1+N2+1); 
    end
    boundaryedges(3,n)=T(3,boundaryedges(2,n));%3st local index in a cell
    boundaryedges(4,n)=T(1,boundaryedges(2,n));%1st local index in a cell   
end

for n=(2*N1+N2+1):2*(N1+N2) %left boundary
     if n==2*N1+N2+1
     boundaryedges(2,n)=boundaryedges(2,2*N1+N2)-1;%cell index
     else
     boundaryedges(2,n)=-(n-(2*N1+N2+1))*2+boundaryedges(2,2*N1+N2+1); 
     end    
     boundaryedges(3,n)=T(3,boundaryedges(2,n));%3st local index in a cell
     boundaryedges(4,n)=T(1,boundaryedges(2,n));%1st local index in a cell   
end
    