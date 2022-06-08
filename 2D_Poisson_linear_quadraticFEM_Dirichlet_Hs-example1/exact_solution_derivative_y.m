function result=exact_solution_derivative_y(x,y)

result=(x.*(1-x/2).*(1-y)-x.*y.*(1-x/2)+x.*y.*(1-x/2).*(1-y)).*exp(x+y);