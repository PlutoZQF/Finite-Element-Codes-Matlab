function result=FE_basis_local_fun_1D(x,vertices,basis_type,basis_index,basis_der_x)
%101:1D linear
%102:1D quadratic
%x:value of Gauss_nodes(k) in [vertices(1),vertices(2)] in each cell

h=vertices(2)-vertices(1);

if basis_type==101
    
    if basis_index==1
        
        if basis_der_x==0
            result=(vertices(2)-x)/h;
         elseif basis_der_x==1
            result=-1/h;
         elseif basis_der_x>=2
             result=0;
        else
            warning='wrong input for basis derivative order!'
        end
            
        
    elseif basis_index==2
         if basis_der_x==0
              result=(x-vertices(1))/h;
              elseif basis_der_x==1
                  result=1/h;
                  elseif basis_der_x>=2
                    result=0;
      else
        warning='wrong input for basis index!'
         end
         
    end
    
    
elseif basis_type==102
    warning='Under construction for 102 basis type.'
 else
        warning='your basis function typles are neither 101 nor 102, still under construction.'
end
