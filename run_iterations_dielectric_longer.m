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
eps = [eps_silver eps_silica eps_silver eps_silica eps_silver eps_silica eps_water];

listOfRunnings=[1 2 3 5 7 9 13 17 19 20] 

for r1 = listOfRunnings;
    for r2 = listOfRunnings;
        for r3 = listOfRunnings;
            for r4 = listOfRunnings;  
                for r5 = listOfRunnings;  
                    for r6 = listOfRunnings;  
                        a = [r1 r2 r3 r4 r5 r6];
                        spectrum = total_cs(a,omega,eps)/(pi*sum(a)^2);
                        myspects = [myspects spect(1:5:501,1)];
                        values = [values ; [r1,r2,r3,r4]];   
                    end
                end
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
csvwrite('dielectric_spectrums_four_temp.csv',myspects);
csvwrite('dielectric_spectrums_four_temp_val.csv',values);