using Plots;
using DifferentialEquations;

function sistem(dx, x, p, t)

    m, c, k = p;
    g = 9.81;
    f(t) = cos(t);

    dx[1] = x[2]
    dx[2] = 1/m*(m*g + f(t) - k * x[1] - c * x[2])

end 

parametri = (5.0, 10.0, 20.0)
pocUslovi = [0.0, 0.0]
interval = (0.0, 20.0)

problem = ODEProblem(sistem, pocUslovi, interval, parametri)

sol = solve(problem)

plot(sol, title = "Translatorni sistem 2", label = ["x[t]" "V[t]"])