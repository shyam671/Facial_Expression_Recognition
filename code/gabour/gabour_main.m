
gaborArray = gaborFilterBank(5,8,39,39);
gabor_testf = zeros(3589,5760);
for k = 1:3589
 k
 I = single(imread(strcat('/home/shyam/Downloads/Independent_study/torch_exp/testImg/',int2str(k),'.jpg')));
 featureVector = gaborFeatures(I,gaborArray,4,4);
 gabor_testf(k,:) = featureVector;
end 