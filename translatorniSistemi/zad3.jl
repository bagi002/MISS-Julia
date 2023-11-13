using Plots
using DifferentialEquations

function pobuda(t)
    y = abs.(sin.(t)*pi/3) 
end

function sistem(dx, x, p, t)
    m1, m2, m3, c, k = p
    g = 9.81
    f  = pobuda(t)

    dx[1] = x[2]
    dx[2] = 1/m1 * (m1*g + k*(x[3]-x[1]) + c*(x[4] - x[2]) - k*x[1])
    dx[3] = x[4]
    dx[4] = 1/m2 * (m2*g + k*(x[5] - x[3]) - c*(x[4] - x[2]) - k*x[3] - k*(x[3] - x[1]))
    dx[5] = x[6]
    dx[6] = 1/m3 * (m3*g - f - k*(x[5] - x[3]))

end

parametri = (5.0, 10.0, 5.0, 10.0, 15.0)
interval = (0.0, 12.0)
pocUslovi = [0.0, 3.0, 0.0, 3.0, 0.0, 3.0]

problem = ODEProblem(sistem, pocUslovi, interval, parametri)

sol = solve(problem)

x2 = [x[2] for x in sol.u]
x6 = [x[6] for x in sol.u]
x1 = [x[1] for x in sol.u]
x3 = [x[3] for x in sol.u]
x5 = [x[5] for x in sol.u]
delta = x5 - x3

~, index1 = findmax(abs.(x1))
~, index2 = findmax(abs.(x3))

p1 = plot(sol.t,[x2, x6, x1, x3], title = "ZADATAK 3", label = ["V1[t]" "V3[t]" "x1[t]" "x2[t]"])

plot!([sol.t[index1]], [x1[index1]], markershape=:o, label="max_x1")
plot!([sol.t[index2]], [x3[index2]], markershape=:o, label="max_x2")

p2 = plot(sol.t, delta, label = "|x2 - x3|")

plot(p1, p2, layout = (2,1))

