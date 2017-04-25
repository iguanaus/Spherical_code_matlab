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

% test case one: 40-nm-radius silver sphere in water
eps = [eps_silver eps_water];
allmycs = []
mylist = [10,20,30,40,50,60,70,80,90,100]
for val = mylist;
    a = [val];
    mycs0 = total_cs(a,omega,eps);
    mycs0 = mycs0(:,1);
    allmycs = [allmycs mycs0];
end
plot(lambda,allmycs)
title('Scattering cross section at varrious radi of a silver sphere');
legend('10','20','30','40','50','60','70','80','90','100');
xlabel('Wavelength (nm)');
ylabel('\sigma/\pi r^2');
