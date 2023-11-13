using Plots
using DifferentialEquations

function pobuda(t)

    tp = rem.(t, 5)
    y = (4 * tp) .* (tp .< 1) + 4 .* ((tp .>= 1) .& (tp .< 2)) +
    (-2 * tp .+ 8) .* ((tp .>= 2) .& (tp .< 3)) + 2 .* ((tp .>= 3) .& (tp .< 4)) +
    (-2 * tp .+ 10) .* (tp .>= 4)

end

function sistem(dx, x, p, t)
    
m1, m2, c1, c2, c3, k1, k2 = p;
f = pobuda(t);

dx[1] = x[2]
dx[2] = 1/m1 * (f - k1 * x[1] - c1 * (x[2] - x[4]))
dx[3] = x[4]
dx[4] = 1/m2 *(c1*(x[2] - x[4]) -x[4]*(c2 + c3) - k2 * x[3])

end

interval = (0.0, 10.0)
pocUslovi =[0.0, 0.0, 0.0, 0.0]
parametri = (10.0, 15.0, 20.0, 20.0, 20.0, 40.0, 40.0)

problem = ODEProblem(sistem, pocUslovi, interval, parametri)

sol = solve(problem)

#plot(sol, title = "Primer sistema 3")

x1 = [x[1] for x in sol.u]
x2 = [x[3] for x in sol.u]

plot(sol.t, [x1, x2], label = ["x1[t]" "x2[t]"], title = "Translatorni sistem III")


