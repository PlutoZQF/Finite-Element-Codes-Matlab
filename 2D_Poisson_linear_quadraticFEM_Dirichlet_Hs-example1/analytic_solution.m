function result=analytic_solution(x,y)
result=x.*y.*(1-x/2).*(1-y).*exp(x+y);