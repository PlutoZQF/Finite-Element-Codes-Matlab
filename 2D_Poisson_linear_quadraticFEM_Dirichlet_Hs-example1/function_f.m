function result=function_f(x,y)
result=-y.*(1-y).*(1-x-x.*x/2).*exp(x+y)-x.*(1-x/2).*(-3*y-y.*y).*exp(x+y);                                                                                                                          