%% Initialization
clear ; close all; clc

% fprintf('Visualizing example dataset for outlier detection.\n\n');

%  The following command loads the dataset. You should now have the
%  variables X, Xval, yval in your environment
% load('ex8data1.mat');

% Visualize the example dataset
% plot(X(:, 1), X(:, 2), 'bx');
% axis([0 30 0 30]);
% xlabel('Latency (ms)');
% ylabel('Throughput (mb/s)');
% 
% fprintf('Program paused. Press enter to continue.\n');
% pause

% fprintf('Visualizing Gaussian fit.\n\n');

%  Estimate mu and sigma2
% [mu, sigma2] = estimateGaussian(X);

%  Returns the density of the multivariate normal at each data point (row) 
%  of X
% p = multivariateGaussian(X, mu, sigma2);

%  Visualize the fit
% visualizeFit(X,  mu, sigma2);
% xlabel('Latency (ms)');
% ylabel('Throughput (mb/s)');
% 
% fprintf('Program paused. Press enter to continue.\n');
% pause;
% 
% pval = multivariateGaussian(Xval, mu, sigma2);
% 
% [epsilon F1] = selectThreshold(yval, pval);
% fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
% fprintf('Best F1 on Cross Validation Set:  %f\n', F1);
% % fprintf('   (you should see a value epsilon of about 8.99e-05)\n');
% % fprintf('   (you should see a Best F1 value of  0.875000)\n\n');
% 
% %  Find the outliers in the training set and plot the
% outliers = find(p < epsilon);
% 
% %  Draw a red circle around those outliers
% hold on
% plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
% hold off
% 
% fprintf('Program paused. Press enter to continue.\n');
% pause;

% training set
X = csvread('F:\cntktest\matlab\machine-learning-ex8\machine-learning-ex8\ex8\test4_compare.csv');
% cross validation set
Xval = csvread('F:\cntktest\matlab\machine-learning-ex8\machine-learning-ex8\ex8\test4_val_all.csv');
% label
yval = csvread('F:\cntktest\matlab\machine-learning-ex8\machine-learning-ex8\ex8\test4_val_result_all.csv');

% save('F:\cntktest\matlab\machine-learning-ex8\machine-learning-ex8\ex8\data1.mat','num')
% load('data1.mat');
% load('ex8data2.mat');

%  Apply the same steps to the larger dataset
[mu sigma2] = estimateGaussian(X);

%  Training set 
p = multivariateGaussian(X, mu, sigma2);

%  Cross-validation set
pval = multivariateGaussian(Xval, mu, sigma2);

%  Find the best threshold
[epsilon F1] = selectThreshold(yval, pval);

%  Select the anomalies
a = selectAnomaly(epsilon, p);

outliers = find(a == 1);

fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
fprintf('Best F1 on Cross Validation Set:  %f\n', F1);
% fprintf('# Outliers found: %d\n', sum(p < epsilon));
fprintf('# Outliers found: %d\n\n', length(outliers));

csvwrite('F:\cntktest\matlab\machine-learning-ex8\machine-learning-ex8\ex8\test4_result4.csv',a);
