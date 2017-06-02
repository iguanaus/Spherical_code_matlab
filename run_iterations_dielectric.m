values = [];
myspects = [];
c1 = 0;
c2 = 0;
data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);

botlim=10.0
toplim=40.0

for r1 = botlim:2:toplim;
    for r2 = botlim:2:toplim;
        for r3 = botlim:2:toplim;
            for r4 = botlim:2:toplim;
                spect = run_spectrum_dielectric_advanced_four(r1,r2,r3,r4);
                myspects = [myspects spect(1:5:501,1)];
                values = [values ; [r1,r2,r3,r4]];          
            end
        end
    end
    if rem(r1,1) ==0;
       disp('On');
       disp(r1);
    end
end
csvwrite('dielectric_spectrums_four.csv',myspects);
csvwrite('dielectric_spectrums_four_val.csv',values);