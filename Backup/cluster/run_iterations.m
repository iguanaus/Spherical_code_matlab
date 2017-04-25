values = [];
myspects = [];
for v = 20.0:0.05:70.0;
    spect = run_spectrum(v);
    myspects = [myspects spect([1,50,100,150,200,250,300,350,400,450,501],1)];
    values = [values v];
end
csvwrite('test.csv',myspects);
csvwrite('test_val.csv',values);