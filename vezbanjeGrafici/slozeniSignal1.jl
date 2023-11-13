using Plots;

t = 0:0.01:6;
sf = abs.(sin.((pi / 3) * t));
y = min.(sf, 0.75)

plot(t, y, title = "Slozeni signal 1")