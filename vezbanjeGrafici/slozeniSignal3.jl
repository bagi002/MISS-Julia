using Plots;

t = 0:0.01:6;
tp = rem.(t,3);

sf = abs.(sin.((pi / 3) * t));
lf = (tp/3);S

y = min.(sf, lf);

p1 = plot(t, sf);
p2 = plot(t, lf);
p3 = plot(t, y);

plot(p1, p2, p3, layout = (3,1), title = "Slozeni signali 3")