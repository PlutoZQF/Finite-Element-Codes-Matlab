function [Gauss_weights,Gauss_nodes]=generate_Gauss_local_1D(vertices,Gauss_type)
%Gauss_weights_reference:the Gauss-Legendre coefficients on the reference interval [-1,1]
%Gauss_nodes_reference:the Gauss-Legendre points on the reference interval [-1,1]
if Gauss_type==2
    Gauss_weights_reference=[1,1];
    Gauss_nodes_reference=[-1/sqrt(3),1/sqrt(3)];
elseif Gauss_type==3
    Gauss_weights_reference=[0.5555555556,0.5555555556,0.8888888889];
    Gauss_nodes_reference=[0.7745966692,-0.7745966692,0];
elseif Gauss_type==4
    Gauss_weights_reference=[0.3478548451,0.3478548451,0.6521451549,0.6521451549];
    Gauss_nodes_reference=[0.8611363116,-0.8611363116,0.3399810436,-0.3399810436];
elseif Gauss_type==8
    Gauss_weights_reference=[0.1012285363,0.1012285363,0.2223810345,0.2223810345,0.3137066459,0.3137066459,0.3626837834,0.3626837834];
    Gauss_nodes_reference=[0.9602898565,-0.9602898565,0.7966664774,-0.7966664774,0.5255324099,-0.5255324099,0.1834346425,-0.1834346425];
else
    warning='Wrong Gauss_type!'
end

Gauss_weights=(vertices(2)-vertices(1))/2*Gauss_weights_reference;
Gauss_nodes=(vertices(1)+vertices(2))/2-(vertices(2)-vertices(1))/2*Gauss_nodes_reference;

