data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);

values = [];
myspects = [];
r1 = 20
r2 = 20
spect = run_spectrum_fixed(r1,r2)
myspects = [myspects spect(1:5:501,1)];
values = [values ; [r1,r2]];
plot(lambda,spect);%spect(1:5:501,1));
csvwrite('test_large_fixed_single_three.csv',myspects);
csvwrite('test_large_fixed_single_three_val.csv',values);