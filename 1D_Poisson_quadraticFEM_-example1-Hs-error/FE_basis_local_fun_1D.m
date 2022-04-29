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
    
     if basis_index==1
             if basis_der_x==0
                 result=2*((x-vertices(1))/h)^2-3*((x-vertices(1))/h)+1;
             elseif basis_der_x==1
                 result=4/(h^2)*(x-vertices(1))-3/h;
             elseif basis_der_x==2
                 result=4/(h^2);
             elseif basis_der_x>=3
                 result=0;
             end
     
     elseif basis_index==2
             if basis_der_x==0
                  result=2*((x-vertices(1))/h)^2-(x-vertices(1))/h;
             elseif basis_der_x==1
                  result=4/(h^2)*(x-vertices(1))-1/h;
             elseif basis_der_x==2
                 result=4/(h^2);
             elseif basis_der_x>=3
                 result=0;
             end
            
     elseif basis_index==3
             if basis_der_x==0
                 result=-4*((x-vertices(1))/h)^2+4*((x-vertices(1))/h);
             elseif basis_der_x==1
                 result=-8/(h^2)*(x-vertices(1))+4/h;
             elseif basis_der_x==2
                 result=-8/(h^2);
             elseif basis_der_x>=3
                 result=0;
             end
            
     end
    
 else
        warning='your basis function types are neither 101 nor 102. 103 is still under construction.'
end
