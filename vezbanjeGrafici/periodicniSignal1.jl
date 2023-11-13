using Plots;

t = 0:0.1:10;
tp = rem.(t,2);
y = (5 * tp) .* (tp .< 1) + (-5 * tp .+ 10) .*(tp .>= 1);

plot(t, y, title = "Periodicni signal 1")