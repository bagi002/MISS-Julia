using Plots
using DifferentialEquations

function sistem(dx, x, p, t)

m1, m2, c, k1, k2, k3 = p
g = 9.81

dx[1] = x[2]
dx[2] = 1/m1 * (m1 * g - k1 * x[1] - k2 * (x[1] - x[3]))
dx[3] = x[4]
dx[4] = 1/m2 * (k2 * (x[1] - x[3]) - k3 * x[3] - m2 * g - c * x[4])

end

pocUslovi = [2.0, 0.0, 0.0, 0.0]
interval = (0.0, 20.0)
parametri = (5.0, 8.0, 10.0, 20.0, 20.0, 20.0)

problem = ODEProblem(sistem, pocUslovi, interval, parametri)
sol = solve(problem)

x2 = [x[2] for x in sol.u]
x4 = [x[4] for x in sol.u]

p1 = plot(sol, title = "SLOZENI SSITEM - KOTURACA")
p2 = plot(sol.t, [x2, x4], title = "PROMJENA BRZINA", label = ["V1[t]" "V2[t]"])

plot(p1,p2,layout = (2, 1))