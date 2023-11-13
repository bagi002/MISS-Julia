using Plots
using DifferentialEquations 

function sistem(dx, x, p, t)

    c1, c2, m, k = p
    f(t) = sin(t)

    dx[1] = x[2]
    dx[2] = 1/m * (f(t) - x[2] * (c1 + c2) - k * x[1])

end

pocetniUslovi = [0.0, 0.0]
parametri = (00.0, 20.0, 100.0, 400.0)
interval = (0.0, 10.0)

problem = ODEProblem(sistem, pocetniUslovi, interval, parametri)

sol = solve(problem)

plot(sol, title = ("TRANSLATORNI SISTEM 1"), label = ["x[t]" "V[t]"])