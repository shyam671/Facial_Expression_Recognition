addpath('/home/shyam/Downloads/Honors/vlfeat-0.9.20/toolbox/');
vl_setup;
binSize = 4 ;
magnif = 3 ;
sift_dtor = zeros(3589,128*144);
for k = 1:3589
k
I = single(imread(strcat('/home/shyam/Downloads/Independent_study/torch_exp/testImg/',int2str(k),'.jpg')));
I = imresize(I,[24,24]);
Is = vl_imsmooth(I, sqrt((binSize/magnif)^2 - .25)) ;
[f, d] = vl_dsift(Is, 'size', binSize) ;
sift_dtor(k,:) = d(:);
end 