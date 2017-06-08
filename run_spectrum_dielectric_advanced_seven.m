%THis runs the specrum with a silver core fixed.
%spect(1:5:501,1)./(3*lambda.lambda)*2*pi
function spectrum = run_spectrum_dielectric_advanced_seven(r1,r2,r3,r4,r5)
lambda = linspace(400, 800, 401)';
omega = 2*pi./lambda;
data = load('data.mat');
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);
eps_silica = 2.04*ones(length(omega), 1);
eps_tio2 = 8.04*ones(length(omega), 1);
eps_water  = 1.77*ones(length(omega), 1);
% load data on epsilon

% test case one: 40-nm-radius silver sphere in water
eps = [eps_silica eps_tio2 eps_silica eps_tio2 eps_water];%eps = [eps_silver eps_silica eps_silver eps_silica eps_silver eps_water];

a = [r1 r2 r3 r4 r5];

spectrum = total_cs(a,omega,eps,8)/(pi*sum(a)^2);
%spectrum = total_cs(a,omega,eps);