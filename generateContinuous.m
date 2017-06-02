% Path to the Matlab functions
addpath 'spherical_T_matrix';
addpath 'spherical_T_matrix/bessel';

% Wavelength of interest: 300 nm to 800 nm
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;

% load data on epsilon
data = load('data.mat');
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);
eps_silica = 2.04*ones(length(omega), 1);
eps_water  = 1.77*ones(length(omega), 1);

% test case one: 40-nm-radius gold sphere in water
eps = [eps_gold eps_silver eps_water];
%epsprime = [eps_silver eps_water];
allmycs = []
mylist = [20 40 60]
for val = mylist;
    for val2 = mylist;
        a = [val val2];
        mycs0 = total_cs(a,omega,eps);
        mycs0 = mycs0(:,1);
        mycs0
        allmycs = [allmycs mycs0];
    end
end
allmycs
plot(lambda,allmycs)
title('Scattering cross section of Gold/Silver sphere');
legend('20/20','20/40','20/60','40/20','40/40','40/60','60/20','60/40','60/60','40','60','80','100','120');
xlabel('Wavelength (nm)');
ylabel('\sigma/\pi r^2');
