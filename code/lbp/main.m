for k = 1:4000
    k
  I = imread(strcat('/home/shyam/Downloads/Independent_study/torch_exp/testImg/',int2str(k),'.jpg'));
  H = zeros(16,18);
  Count = 1;
  for i = 1:3
    for j = 1:3
       tempI = I(1+(i-1)*16:i*16,1 + (j-1)*16:j*16); 
       H1=squeeze(lbp(tempI,1,16,mapping,'nh'));
      H(Count,:) = H1;  
    end
  end
 dlmwrite('/home/shyam/Downloads/Independent_study/torch_exp/lbp_exp/testF.csv',H(:)','delimiter',',','-append');
end
