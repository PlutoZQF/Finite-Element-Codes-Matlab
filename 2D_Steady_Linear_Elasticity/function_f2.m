function result=function_f2(x,y)

lamda=function_lamda(x,y);
mu=function_mu(x,y);

result=-(lamda+2*mu)*(2*x.*(x-1))-(lamda+mu)*(pi^2*cos(pi*x).*cos(pi*y))-mu*(2*y.*(y-1));                                                                                                                       