data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);

values = [];
myspects = [];
r1 = 62.6;
r2 = 10.0;
r3 = 10.0;
r4 = 86.4;
r5 = 42;
spect = (2*pi)*run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)./(3*lambda.*lambda)
r1 = 63.6;
r2 = 10.0;
r3 = 10.0;
r4 = 86.4;
r5 = 26;
spect2 = (2*pi)*run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)./(3*lambda.*lambda)
% r1 = 39.8;
% r2 = 17.6;
% r3 = 15.8;
% r4 = 47.7;
% r5 = 22.6;
% spect3 = (2*pi)*run_spectrum_dielectric_advanced_six(r1,r2,r3,r4,r5)./(3*lambda.*lambda)
myspects = [myspects spect(1:5:501,1)];
values = [values ; [r1,r2,r3,r4,r5]];
%plot(lambda(1:5:501),[mylist',spect(1:5:501,1),spect2(1:5:501,1),spect3(1:5:501,1)]);%spect(1:5:501,1));
hold on
area([485,585],[4,4],'EdgeColor','none')
alpha(.2)
%plot(lambda(1:2:501),[mylist',spect(1:2:501,1),spect2(1:2:501,1)])
plot(lambda(1:2:501),[spect(1:2:501,1)])%,spect2(1:2:501,1)])
hold off

xlabel('Wavelength (nm)');
ylabel('Cross Scattering Amplitude (normalized by power in dipole channel)');
%title('Residuals');
title('Geometries to match desired spectrums');
%legend('14/25/24/38 after 2 hours','14/25/24/38 after 6 hours');
%legend('Desired super-scattering at 465nm','Iteration One, 3053.4,30,30,30,30','Iteration Two, 33,35,28,25,26','Iteration Three, 19,60,33,51,10');
legend('Desired scattering',strcat('Nanoparticle',num2str(r1),'/',num2str(r2),'/',num2str(r3),'/',num2str(r4)),'a');
csvwrite('test_dielectric.csv',myspects);
csvwrite('test_dielectric_val.csv',values);