load CNN_data
[COEFF, SCORE, LATENT,~,~,~] = pca(CNN_data);
xTr = SCORE*COEFF(:,1:250);
xTr = xTr';