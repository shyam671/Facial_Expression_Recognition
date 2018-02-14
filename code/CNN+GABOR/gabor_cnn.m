 load('gabor_testf.mat');
 load ('gabor_trainf.mat');
X = zeros(32298,5760);
X(1:28709,:) = gabor_trainf;
X(28710:32298,:) = gabor_testf;
[COEFF, SCORE, LATENT, ~, ~, ~] = pca(X);
data = SCORE*COEFF(:,1:600);
save data.mat data -v7.3