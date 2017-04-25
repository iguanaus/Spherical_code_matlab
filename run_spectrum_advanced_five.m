%THis runs the specrum with a silver core fixed.
function spectrum = run_spectrum_advanced_five(r1,r2,r3,r4,r5)
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
data = load('data.mat');
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);
eps_silica = 2.04*ones(length(omega), 1);
eps_water  = 1.77*ones(length(omega), 1);
% load data on epsilon

% test case one: 40-nm-radius silver sphere in water
eps = [eps_silver eps_gold eps_silver eps_gold eps_silver eps_water];
a = [r1 r2 r3 r4 r5];
spectrum = total_cs(a,omega,eps)/(pi*sum(a)^2);
