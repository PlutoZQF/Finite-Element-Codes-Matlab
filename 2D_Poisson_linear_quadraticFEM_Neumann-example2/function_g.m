function result=function_g(x,y)
if x==-1
    result=exp(-1+y);
elseif x==1
    result=exp(1+y);
elseif y==1
    result=exp(x+1);
end