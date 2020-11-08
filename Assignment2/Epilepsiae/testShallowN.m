%function [Sensivity, Specificity] = testShallowN()
    %Get data
    data = load('/home/sergio/Dropbox/AC/PL2/Data/54802.mat');
    data = changeData(data);
    [trIndex, vIndex, ttIndex] = datasetDivision(data);
    
    %Devide the dataset into training and testing
        %Training
    training.FeatVectSel = data.FeatVectSel(:,trIndex:ttIndex);
    training.Trg = data.Trg(trIndex:ttIndex,:);
        %Testing
    testing.FeatVectSel = data.FeatVectSel(:,ttIndex+1:end);
    testing.Trg = data.Trg(ttIndex+1:end,:);
    
    %Balance the data
    %dataB = balanceData(training);
    
    
    dataB = balanceData(training);
    
    %Train the Network
    [network] = trainLRN(dataB,'trainlm',10,1,'purelin',1);
    
    %Teste the network
    output = network(testing.FeatVectSel);
    targetT = createTarget(testing);
    %perf = perform(network,y,target,EW);
    
    %Calculate de value of SE and SP
    %Sensivity = TP/(TP + FN);
    %Specificity = TN/(TN + FP);
%end