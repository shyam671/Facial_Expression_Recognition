load('CNN_test500.mat');
load('CNN_train500.mat');
load('test.mat');
load('train.mat');
load('test_labels');
load('train_labels');

CNN_train500 =  bsxfun(@rdivide,CNN_train500,max(abs(CNN_train500),[],2));
CNN_test500 =   bsxfun(@rdivide,CNN_test500,max(abs(CNN_test500),[],2));

train =  bsxfun(@rdivide,train,max(abs(train),[],2));
test =   bsxfun(@rdivide,test,max(abs(test),[],2));

train_data = zeros(28709,1100);
test_data = zeros(3589,1100);

train_data(:,1:500) = CNN_train500; train_data(:,501:1100) = train;
test_data(:,1:500) = CNN_test500; test_data(:,501:1100) = test;

Class = knnclassify(test_data(1:1000,:),train_data,train_labels, 1);
 x = find(Class == test_labels(1:1000));