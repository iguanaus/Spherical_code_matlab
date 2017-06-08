values = [];
myspects = [];
c1 = 0;
c2 = 0;
data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);

eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_silica = 2.04*ones(length(omega), 1);
eps_water  = 1.77*ones(length(omega), 1);
% load data on epsilon

% test case one: 40-nm-radius silver sphere in water
eps = [eps_silver eps_silica eps_silver eps_silica eps_silver eps_water];

listOfRunnings1=[10 15 20 25 30 35]
%listOfRunnings2=[40 45 50 55 60]
listOfRunnings =[10 15 20 25 30 35 40 45 50 55 60]
%listOfRunnings=[10 20]
r1=30;
r2=53;
r3=68;
r4=120;
r5=10;
spect = (2*pi)*run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)./(3*lambda.*lambda);
myspects = [myspects spect(1:2:501,1)];
values = [values ; [r1,r2,r3,r4]];
plot(myspects)
%values = [values ; [r1,r2,r3,r4,r5]];
%myname = num2str(strcat('test_dielectric_large_',num2str(r1),'_',num2str(r2),'_',num2str(r3),'_',num2str(r4),'_',num2str(r5)));
myname = num2str(strcat('test_dielectric_large_',num2str(r1),'_',num2str(r2),'_',num2str(r3),'_',num2str(r4)));
csvwrite(strcat(myname,'.csv'),myspects);
csvwrite(strcat(myname,'_val.csv'),values);