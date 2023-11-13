using Plots;
using DifferentialEquations

function VanderPol(dx, x, p, t)

    ni = p;

    dx[1] = x[2]
    dx[2] = ni*(1 - x[1]^2) * x[2] - x[1]

end

xO = [0.25, 0.25]
interval = (0.0, 30.0)
ni = 1
parametri = ni

prob = ODEProblem(VanderPol, xO, interval, parametri)

sol = solve(prob)
plot(sol, title = "Vander Polov Generator")