function result=function_f1(x,y)

lamda=function_lamda(x,y);
mu=function_mu(x,y);

result=-(lamda+2*mu)*(-pi^2*sin(pi*x)*sin(pi*y))-(lamda+mu)*((2*x-1)*(2*y-1))-mu*(-pi^2*sin(pi*x)*sin(pi*y));