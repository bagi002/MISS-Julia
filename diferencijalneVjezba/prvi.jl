#Ukljucivanje Biblioteka
using Plots;
using  DifferentialEquations;
#definisanje funkcije
f(u,p,t) = sin(t)
#definisanje parametara
uO = 0.0
tspan = (0.0, 10.0)
#definisanje problema
prob = ODEProblem(f, uO, tspan)
#resavanje problema i crtanje grafika

sol = solve(prob)
plot(sol)
