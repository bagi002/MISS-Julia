using Plots

t = 0:0.01:(2*pi);
tp = rem.(t,1);

f = (tp * 0.0) .* (tp .>=  0.5) + (sin.(t)) .* (tp .< 0.5);

y = sin.(t);

plot(t,f)
