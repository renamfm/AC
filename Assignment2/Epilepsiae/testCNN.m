function [network] = testCNN()
data = load('/home/sergio/Dropbox/AC/PL2/Data/54802.mat');
data = changeData(data);

network = trainCNN(data);
data4D = preProcessingCNN(data);
result = classify(network,data4D.FeatVectSel);
%Put here the performance results
end