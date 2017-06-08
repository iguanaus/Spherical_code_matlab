data = load('data.mat');
lambda = linspace(300, 800, 501)';
omega = 2*pi./lambda;
eps_silver = interp1(data.omega_silver,data.epsilon_silver,omega);
eps_gold   = interp1(data.omega_gold,data.epsilon_gold,omega);
r1 = 100
r2 = 10
r3 = 100
r4 = 10
r5 = 200
r6 = 10
values = [];
myspects = [];
posVals = [10];
mymaxes = [];
for v1=[5 30 50];
    for v2=[5 30 50];
        for v3=[5 30 50];
            for v4=[5 30 50];
                 
                spect = ((2*pi)*run_spectrum_dielectric_advanced_four(v1,v2,v3,v4)./(3*lambda.*lambda));
                %spect(1:1:501,1)./(3*lambda.*lambda)*2*pi
                myspects = [myspects spect(1:1:501,1)];%./(3*lambda.*lambda)*2*pi];
                myname = num2str(strcat(num2str(v1),'--',num2str(v2),'--',num2str(v3),'--',num2str(v4)));
                values = [values , string(myname)]; %[v1,v2,v3,v4]];
                %end
                %mymaxes = [mymaxes , max(spect)];
            end
        end
    end
end
%values = [values ; [r1,r2,r3,r4,r5,r6]];

%spect(1:1:501,1)./(3*lambda.*lambda)*2*pi

plot(lambda(1:1:501),myspects);%spect(1:5:501,1));
legend(values)
xlabel('Wavelength (nm)');
ylabel('Cross Scattering Amplitude (normalized by power in dipole channel)');
title('Cross Scattering Amplitude for Test Nanoparticles');
%csvwrite('test_large_fixed_five_temp.csv',myspects);
%csvwrite('test_large_fixed_five_val_temp.csv',values);
%mymaxes