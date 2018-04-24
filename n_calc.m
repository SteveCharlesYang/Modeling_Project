t = 3;
k = 2247;
n0 = (1/7)*k;
nt = @(r)((n0*k*exp(r*t))/((exp(r*t)-1)*n0 + k));
ezplot(nt)