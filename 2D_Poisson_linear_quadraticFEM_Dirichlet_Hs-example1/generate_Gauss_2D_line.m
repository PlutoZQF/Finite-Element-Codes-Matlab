function [Gauss_weights_line,Gauss_nodes_line]=generate_Gauss_2D_line(vertices)
%chapter 3; page 96,92-93
Gauss_type=4;%can choose 2,3,4 or8 here.
%vertices=[x1,x2;y1,y2];
Gauss_nodes_line=zeros(2,Gauss_type);
%Gauss_nodes_line=[x1,x2,x3...;y1,y2,y3...];

%%%% here we only consider vertical and horizontal boundary edges!!!
if vertices(1,1)==vertices(1,2)
%x1=x2,this is a vertical edge!
vertices1D=[vertices(2,1),vertices(2,2)];
[Gauss_weights_line,Gauss_nodes_y]=generate_Gauss_local_1D(vertices1D,Gauss_type);
Gauss_nodes_line(1,:)=vertices(1,1);
Gauss_nodes_line(2,:)=Gauss_nodes_y;
end

if vertices(2,1)==vertices(2,2)
%y1=y2,this is a horizontal edge!
vertices1D=[vertices(1,1),vertices(1,2)];
[Gauss_weights_line,Gauss_nodes_x]=generate_Gauss_local_1D(vertices1D,Gauss_type);
Gauss_nodes_line(1,:)=Gauss_nodes_x;
Gauss_nodes_line(2,:)=vertices(2,1);
end