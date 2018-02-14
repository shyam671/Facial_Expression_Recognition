addpath('/home/shyam/Downloads/Honors/vlfeat-0.9.20/toolbox/');
vl_setup;
cellSize = 8 ;
for k = 1:30000
 k 
 I = single(imread(strcat('/home/shyam/Downloads/Independent_study/torch_exp/trainImg/',int2str(k),'.jpg')));
 hog = vl_hog(I, cellSize) ;
 dlmwrite('/home/shyam/Downloads/Independent_study/torch_exp/exp/trainF.csv',hog(:)','delimiter',',','-append');
end 