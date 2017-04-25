data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);

values = [];
myspects = [];
r1 = 15.2
r2 = 37.5
spect1 = run_spectrum_fixed(r1,r2)
r1 = 15.29945
r2 = 37.3933
spect2 = run_spectrum_fixed(r1,r2)
hold on
plot(lambda,[spect1(1:1:end,1),spect2(1:1:end,1)]);%spect(1:5:501,1));
%plot(lambda,spect2(1:1:end,1));
legend('Desired for 15.2/37.5','NN for reveresed 15.2/37.5');

