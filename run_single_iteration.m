values = [];
myspects = [];
v = 23.5275
spect = run_spectrum(v);
myspects = [myspects spect(1:5:501,1)];
values = [values v];
if rem(v,1) ==0 ;
    disp('On');
    disp(v);
end
csvwrite('test_large_single.csv',myspects);
csvwrite('test_large_single_val.csv',values);