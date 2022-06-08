function [A,b]=treat_Robin_boundary_2D(fun_cq,fun_cr,A,b,boundaryedges,number_of_local_basis_fun_test,basis_type_test,number_of_local_basis_fun_trial,basis_type_trial,Tb,T,P)
%boundaryedges(1, k)=-1 means Dirichlet boundary edge;
%boundaryedges(1, k)=-2 means Neumann boundary edge;
%boundaryedges(1, k)=-3 means Robin boundary edge.
%boundaryedges(2, k) is the global  index of the element.
%boundaryedges(3:4,k) are the global node index of the first(second) 
%end node of the kth boundary boundary
%chapter 3,page 121

vertices_edge=zeros(2,2);%=[x1,x2;y1,y2], vertices in  a edge!
nbe=size(boundaryedges,2);%the number of boundary edges
for k=1:1:nbe
    if boundaryedges(1,k)==-3
        i=boundaryedges(2,k);
        vertices=P(:,T(:,i));% note: vertices in  a cell!
        vertices_edge(:,1)=P(:,boundaryedges(3,k));
        vertices_edge(:,2)=P(:,boundaryedges(4,k));
        [Gauss_weights_line,Gauss_nodes_line]=generate_Gauss_2D_line(vertices_edge);
        for beta=1:number_of_local_basis_fun_test      
            w=Gauss_int_line_test(fun_cq,Gauss_weights_line,Gauss_nodes_line,vertices,basis_type_test,beta);
            b(Tb(beta,i),1)=b(Tb(beta,i),1)+w;
        end
        for alpha=1:number_of_local_basis_fun_trial
            for beta=1:number_of_local_basis_fun_test
                r=Gauss_int_line_test_trial(fun_cr,Gauss_weights_line,Gauss_nodes_line,vertices,basis_type_test,beta,basis_type_trial,alpha);
                A(Tb(beta,i),Tb(alpha,i))=A(Tb(beta,i),Tb(alpha,i))+r;
            end
        end



    end   
end