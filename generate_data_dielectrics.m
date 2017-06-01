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
%eps = [eps_silver eps_silica eps_silver eps_silica eps_silver eps_water];

%listOfRunnings1=[10 15 20 25 30 35]
%listOfRunnings2=[40 45 50 55 60]
listOfRunnings =[10 16 22 28 34 40 46 52 58 64 70 76 82 88 94 100]

%listOfRunnings=[10 20]

for r1 = listOfRunnings;
    for r2 = listOfRunnings;
        for r3 = listOfRunnings;
            for r4 = listOfRunnings;
                spect = (2*pi)*run_spectrum_dielectric_advanced_four(r1,r2,r3,r4)./(3*lambda.*lambda);
                myspects = [myspects spect(1:2:501,1)];
                values = [values ; [r1,r2,r3,r4]];
            end
        end
        if rem(r2,1) ==0;
           disp('Onr2');
           disp(r2);
        end
    end
    if rem(r1,1) ==0;
       disp('Onr1');
       disp(r1);
    end
end
csvwrite('double_dielectrics.csv',myspects);
csvwrite('double_dielectrics_val.csv',values);