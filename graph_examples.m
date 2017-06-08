data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);

values = [];
myspects = [];
r1 = 45;
r2 = 15;
r3 = 40;
r4 = 15;
r5 = 10;
spect1 = (2*pi)*run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)./(3*lambda.*lambda)
r1 = 13;
r2 = 10;
r3 = 80;
r4 = 13;
r5 = 20;
spect2 = (2*pi)*run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)./(3*lambda.*lambda)
r1 = 54.2;
r2 = 10;
r3 = 41.1;
r4 = 14.48;
%r5 = 27.0;
spect3 = (2*pi)*run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)./(3*lambda.*lambda)
hold on
%plot(lambda,[spect1(1:1:end,1)-spect2(1:1:end,1),spect1(1:1:end,1)-spect3(1:1:end,1)]);%spect(1:5:501,1));
plot(lambda,[spect1(1:1:end,1),spect2(1:1:end,1),spect3(1:1:end,1)]);%spect(1:5:501,1));
xlabel('Wavelength (nm)');
ylabel('Cross Scattering Amplitude (normalized by power in dipole channel)');
title('Plotting what the NN returns for the closest geometry');
legend('Desired for 45/15/40/15','old-NN reversed 13/10/80/13','new-NN for reveresed 54/10/41/15');

