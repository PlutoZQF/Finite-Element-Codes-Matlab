function result=reference_basis_2D(xh,yh,basis_type,basis_index,basis_der_x,basis_der_y)
%201:2D linear
%202:2D quadratic

if basis_type==201
    
     if basis_index==1
         if basis_der_x==0 && basis_der_y==0
             result=-xh-yh+1;
         elseif basis_der_x==1 && basis_der_y==0
             result=-1;
         elseif basis_der_x==0 && basis_der_y==1
             result=-1;
         elseif basis_der_x==2 && basis_der_y==0
             result=0;
         elseif basis_der_x==0 && basis_der_y==2
             result=0;
         elseif basis_der_x==1 && basis_der_y==1
             result=0;
         else
            warning='Wrong basis_der!'            
         end
             
     elseif basis_index==2
         if basis_der_x==0 && basis_der_y==0
             result=xh;
         elseif basis_der_x==1 && basis_der_y==0
             result=1;
         elseif basis_der_x==0 && basis_der_y==1
             result=0;
         elseif basis_der_x==2 && basis_der_y==0
             result=0;
         elseif basis_der_x==0 && basis_der_y==2
             result=0;
         elseif basis_der_x==1 && basis_der_y==1
             result=0;       
        else
            warning='Wrong basis_der!'             
         end
         
     elseif basis_index==3
         if basis_der_x==0 && basis_der_y==0
             result=yh;
         elseif basis_der_x==1 && basis_der_y==0
             result=0;
         elseif basis_der_x==0 && basis_der_y==1
             result=1;
         elseif basis_der_x==2 && basis_der_y==0
             result=0;
         elseif basis_der_x==0 && basis_der_y==2
             result=0;
         elseif basis_der_x==1 && basis_der_y==1
             result=0;      
         else
            warning='Wrong basis_der!'            
         end     
     end
        
elseif basis_type==202
    
    if basis_index==1       
        if basis_der_x==0 && basis_der_y==0
            result=2*xh^2+2*yh^2+4*xh*yh-3*yh-3*xh+1;
        elseif basis_der_x==1 && basis_der_y==0
            result=4*xh+4*yh-3;
        elseif basis_der_x==0 && basis_der_y==1
            result=4*xh+4*yh-3;
        elseif basis_der_x==2 && basis_der_y==0    
            result=4;
        elseif basis_der_x==0 && basis_der_y==2
            result=4;
        elseif basis_der_x==1 && basis_der_y==1
            result=4;
        else
            warning='Wrong basis_der!'
        end
        
    elseif basis_index==2
        if basis_der_x==0 && basis_der_y==0
            result=2*xh^2-xh;
        elseif basis_der_x==1 && basis_der_y==0
            result=4*xh-1;
        elseif basis_der_x==0 && basis_der_y==1
            result=0;
        elseif basis_der_x==2 && basis_der_y==0    
            result=4;
        elseif basis_der_x==0 && basis_der_y==2
            result=0;
        elseif basis_der_x==1 && basis_der_y==1
            result=0;
        else
            warning='Wrong basis_der!'
        end
        
    elseif basis_index==3
         if basis_der_x==0 && basis_der_y==0
            result=2*yh^2-yh;
        elseif basis_der_x==1 && basis_der_y==0
            result=0;
        elseif basis_der_x==0 && basis_der_y==1
            result=4*yh-1;
        elseif basis_der_x==2 && basis_der_y==0    
            result=0;
        elseif basis_der_x==0 && basis_der_y==2
            result=4;
        elseif basis_der_x==1 && basis_der_y==1
            result=0;
        else
            warning='Wrong basis_der!'
        end
        
    elseif basis_index==4
        if basis_der_x==0 && basis_der_y==0
            result=-4*xh^2-4*xh*yh+4*xh;
        elseif basis_der_x==1 && basis_der_y==0
            result=-8*xh-4*yh+4;
        elseif basis_der_x==0 && basis_der_y==1
            result=-4*xh;
        elseif basis_der_x==2 && basis_der_y==0    
            result=-8;
        elseif basis_der_x==0 && basis_der_y==2
            result=0;
        elseif basis_der_x==1 && basis_der_y==1
            result=-4;
        else
            warning='Wrong basis_der!'
        end
        
    elseif basis_index==5
        if basis_der_x==0 && basis_der_y==0
            result=4*xh*yh;
        elseif basis_der_x==1 && basis_der_y==0
            result=4*yh;
        elseif basis_der_x==0 && basis_der_y==1
            result=4*xh;
        elseif basis_der_x==2 && basis_der_y==0    
            result=0;
        elseif basis_der_x==0 && basis_der_y==2
            result=0;
        elseif basis_der_x==1 && basis_der_y==1
            result=4;
        else
            warning='Wrong basis_der!'
        end
        
    elseif basis_index==6
        if basis_der_x==0 && basis_der_y==0
            result=-4*yh^2-4*xh*yh+4*yh;
        elseif basis_der_x==1 && basis_der_y==0
            result=-4*yh;
        elseif basis_der_x==0 && basis_der_y==1
            result=-8*yh-4*xh+4;
        elseif basis_der_x==2 && basis_der_y==0    
            result=0;
        elseif basis_der_x==0 && basis_der_y==2
            result=-8;
        elseif basis_der_x==1 && basis_der_y==1
            result=-4;
        else
            warning='Wrong basis_der!'
        end
    end   
end