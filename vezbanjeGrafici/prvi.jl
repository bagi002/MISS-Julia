using Plots;

t = 0:0.01:10;
y = 2 .^ t;
z = -2 .^ t;

plot(t,y, title = "Modulator")
plot!(t,z)