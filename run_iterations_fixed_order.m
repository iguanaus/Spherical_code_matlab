values = [];
myspects = [];
c1 = 0;
c2 = 0;
data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);


for r1 = 10.0:1:40.0;
    for r2 = 10.0:1:40.0;
        for r3 = 10.0:1:40.0;
            for r4 = 10.0:1:40.0;
                for r5 = 10.0:1:40.0;
                    spect = run_spectrum_advanced_five(r1,r2);
                    myspects = [myspects spect(1:5:501,1)];
                    values = [values ; [r1,r2,r3,r4,r5]];          
                end
            end
        end
    end
    if rem(r1,1) ==0;
       disp('On');
       disp(r1);
    end
end
csvwrite('test_large_fixed_five.csv',myspects);
csvwrite('test_large_fixed_five_val.csv',values);