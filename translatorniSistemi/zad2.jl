using Plots
using DifferentialEquations

# Crtanje signala pobude

t = 0:0.01:10
tp = rem.(t, 1)
f = (t * 0.5) .* (tp .< 0.5) + (0) .* (tp .>= 0.5)
p1 = plot(t, f);

# definisanje funkcije pobude

function pobuda(t)
    tp = rem.(t, 1)
    f = (t * 0.5) .* (tp .< 0.5) + 0 .* (tp .>= 0.5)
end

# Definisanje sistema za rijesavanje 

function sistem(dx, x, p, t)
    m1, m2, c1, c2, k1, k2 = p
    g = 9.81
    f = pobuda(t)

    dx[1] = x[2]
    dx[2] = 1/m1 * (k2*(x[3] - x[1]) + m1*g - c1*x[2] - k1*x[1])
    dx[3] = x[4]
    dx[4] = 1/m2 * (f + m2*g - c2*x[4] - k2*(x[3] - x[1]))
end

# Definisanje poznatih informacija

interval = (0.0, 10.0)
pocUslovi = [-1.0, 0.0, -1.0, 0.0]
paarametri = (20.0, 10.0, 10.0, 10.0, 20.0, 40.0)

#drfinisanje i resavanje problema

problem = ODEProblem(sistem, pocUslovi, interval, paarametri)

sol = solve(problem)
plot(sol)
