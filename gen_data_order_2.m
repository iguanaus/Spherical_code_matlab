values = [];
myspects = [];
c1 = 0;
c2 = 0;
data = load('data.mat');
lambda = linspace(400, 800, 401)';
omega = 2*pi./lambda;

% load data on epsilon

% test case one: 40-nm-radius silver sphere in water
%eps = [eps_silver eps_silica eps_silver eps_silica eps_silver eps_water];

listOfRunnings=[10 20]

listOfRunnings1=[30,35,40,45]
listOfRunnings2=[50,55,60,65,70]
listOfRunnings=[30,35,40,45,50,55,60,65,70]

listOfRunnings=[10 20 30]


for r1 = listOfRunnings;
    for r2 = listOfRunnings;
        for r3 = listOfRunnings;
            for r4 = listOfRunnings;
                orspect = run_spectrum_dielectric_advanced_four(r1,r2,r3,r4);
                spect = (2*pi)*orspect(1:1:401,1)./(3*lambda.*lambda);
                myspects = [myspects spect(1:2:401)];
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
csvwrite('order_die_2.csv',myspects);
csvwrite('order_die_2_val.csv',values);