function error=compute_max_FE_nodes(ana_sol,solution,Pb)
Nb=length(Pb);
for n=1:Nb
    ana_sol_array(n)=feval(ana_sol,Pb(n));
    err_arr(n)=abs(solution(n)-ana_sol_array(n));
end

analytic_solution=ana_sol_array'
err_arr;
error=max(err_arr);
