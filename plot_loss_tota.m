mydata = load('cum_loss_longrun.txt')
plot(mydata)
xlabel('Epochs trained (in 100`s)');
ylabel('Mean Square Error between spectrums');
title('Loss Over Epochs');
