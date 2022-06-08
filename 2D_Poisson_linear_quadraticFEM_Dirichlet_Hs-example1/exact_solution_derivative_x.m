function result=exact_solution_derivative_x(x,y)

result=(y.*(1-x/2).*(1-y)-0.5*x.*y.*(1-y)+x.*y.*(1-x/2).*(1-y)).*exp(x+y);