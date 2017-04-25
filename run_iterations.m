values = [];
myspects = [];
for v = 10.0:0.05:100.0;
    spect = run_spectrum(v);
    myspects = [myspects spect(1:5:501,1)];
    values = [values v];
    if rem(v,1) ==0 ;
        disp('On');
        disp(v);
    end
end
csvwrite('test_large.csv',myspects);
csvwrite('test_large_val.csv',values);