function result=generate_initial_vector(func_ini,Pb)

result=feval(func_ini,Pb(1,:),Pb(2,:));
result=result';