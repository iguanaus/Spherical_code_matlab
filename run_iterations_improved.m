values = [];
myspects = [];
c1 = 0;
c2 = 0;
data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);


for r1 = 20.0:2:60.0;
    for r2 = 20:40:60.0;
        for c1 = 1:1:2;
            for c2 = 1:1:2;
                if c1 == 1;
                    m1 = eps_silver;
                else;
                    m1 = eps_gold;
                end
                if c2 == 1;
                    m2 = eps_silver;
                else;
                    m2 = eps_gold;
                end 
                spect = run_spectrum_advanced(r1,r2,m1,m2);
                myspects = [myspects spect(1:5:501,1)];
                values = [values ; [r1,c1,r2,c2]];
            end
        end
    end
    if rem(r1,1) ==0;
        disp('On');
        disp(r1);
    end
end
csvwrite('test_large_complex.csv',myspects);
csvwrite('test_large_complex_val.csv',values);