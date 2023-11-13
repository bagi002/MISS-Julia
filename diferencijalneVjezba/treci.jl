using Plots
using DifferentialEquations

function sistem(dx, x, p, t)

    A, B = p

    dx[1] = u(t) + A * x[3]
    dx[2] = x[3]
    dx[3] = x[2] - B * x[1]

end

function u(t)

    tp = rem(t,5)

    u = (tp * 3) .* (tp .< 1) + 3 .* ((tp .>= 1) & (tp .< 4)) +
        (-3 * tp + 15) .* (tp .>= 4)

end

pocVrednosti = [-1.0, 1.0, 0.5]
A, B = (1.0, 2.0)
parametri = (A, B)
interval = (0.0, 15.0)

problem = ODEProblem(sistem, pocVrednosti, interval, parametri)

sol = solve(problem)

plot(sol, title = "Simulirani problem 2")