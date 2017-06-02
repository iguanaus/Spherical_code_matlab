data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);
r1 = 10
r2 = 10
r3 = 10
r4 =10
values = [];
myspects = [];
for v1=[10 20];
    for v2=[10 20];
        for v3=[10 20];
            for v4=[10 20];
                spect = run_spectrum_dielectric_advanced_six(v1,v2,v3,v4);
                myspects = [myspects spect(1:5:501,1)];
                %values = [values ; [v1,v2,v3,v4]];
            end
        end
    end
end
values = [values ; [r1,r2,r3,r4]];

plot(lambda(1:5:501),myspects);%spect(1:5:501,1));
csvwrite('test_large_fixed_five_temp.csv',myspects);
csvwrite('test_large_fixed_five_val_temp.csv',values);