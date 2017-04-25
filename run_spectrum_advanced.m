function spectrum = run_spectrum_advanced(r1,r2,m1,m2)
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silica = 2.04*ones(length(omega), 1);
eps_water  = 1.77*ones(length(omega), 1);
% load data on epsilon

% test case one: 40-nm-radius silver sphere in water
eps = [m1 m2 eps_water];
a = [r1 r2];
spectrum = total_cs(a,omega,eps)/(pi*sum(a)^2);
