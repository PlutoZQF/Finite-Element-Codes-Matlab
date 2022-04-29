function [Pb,Tb]=generate_PbTb(basis_type_trial,basis_type_test,P,T,left,right,h)
%basis_type_trial=basis_type_test, so only consider basis_type_trial now

if basis_type_trial==101
Pb=P;
Tb=T;
elseif basis_type_trial==102
    
    number_basis_func=2*(right-left)/h+1;
    
    for k=1:number_basis_func
    Pb(k)=left+(k-1)*h/2;
    end
    
    number_cell=(right-left)/h;
    for n=1:number_cell
        Tb(1,n)=2*n-1;
        Tb(2,n)=2*n+1;
        Tb(3,n)=2*n;
    end
    
else
    warning='Under construction for 103 !'
    
end