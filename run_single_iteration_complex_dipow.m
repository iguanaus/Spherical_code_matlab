data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);

values = [];
myspects = [];
r1 = 30;
r2 = 30;
r3 = 30;
r4 = 30;
spect = run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)
r1 = 32;
r2 = 80;
r3 = 80;
r4 = 80.00;
spect2 = run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)
r1 = 10.4;
r2 = 12.3;
r3 = 10;
r4 = 23.2;
spect3 = run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)
myspects = [myspects spect(1:5:501,1)];
values = [values ; [r1,r2,r3,r4]];
plot([mylist',spect(1:5:501,1),spect2(1:5:501,1),spect3(1:5:501,1)]);%spect(1:5:501,1));
xlabel('Wavelength (nm)');
ylabel('\sigma/\pi r^2');
%title('Residuals');
title('Geometries to match desired spectrums');
%legend('14/25/24/38 after 2 hours','14/25/24/38 after 6 hours');
legend('Desired super-scattering at 425nm','Iteration One, 20,20,20,20','Iteration Two, 15,18,24,15','Iteration Three, 10,10,15.8,10');
csvwrite('test_dielectric.csv',myspects);
csvwrite('test_dielectric_val.csv',values);