%%
% File to convert tensorflow model .*h5 format become .*mat format
model = importKerasNetwork('C:\Users\Adi Kelvianto\ANN_7AUG_SET1.h5');
plot(model)

%%
% Convert .*h5 format to .*mat format
model_mat = matfile('model_7aug_set1.mat');
save('model_7aug_set1.mat','model')