function [network] = trainLSTM(Data)
    %Change data
    Data = changeData(Data);
    %Assign data and target
    data = Data.FeatVectSel;
    target = Data.Trg;

    %----------Pre processing------------
    [R,C] = size(data);
    %We need to convert the data to a cell, num2cell does not work
    cell ={};
    for i=1:C
      cell{end+1,1} = data(:,i);  
    end
    data = cell;    %Just to be simpler
    %We can categorize like this since the array only has 1 row
    target = categorical(target);  
    
    %------------LSTM Implementation-----------
    %Implement lst Layer
    %Output mode is last because we want a sequence-to-label classification 
    numFeatures = R;
    numHiddenUnits = 100;
    numClasses = 3;
    layers = [sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];
    
    %Train configuration
    maxEpochs = 20;
    solverFcn = 'adam';
    config = trainingOptions(solverFcn,...
        'MaxEpochs',maxEpochs,...
        'GradientThreshold',1,...
        'Shuffle','never',...
        'Verbose',0,...
        'Plots','training-progress');

    %Train network
    network = trainNetwork(data, target, layers, config);    
end