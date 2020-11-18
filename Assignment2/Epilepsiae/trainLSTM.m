function [network] = trainLSTM(Data, neurons,solverFcn)
    data = Data.FeatVectSel;
    target = Data.Trg;
    
    [R, data, target] = preProcessingLSTM(data, target);
    
    %------------LSTM Implementation-----------
    %Implement lst Layer
    %Output mode is last because we want a sequence-to-label classification 
    numFeatures = R;
    numClasses = 3;
    layers = [sequenceInputLayer(numFeatures)
    lstmLayer(neurons,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];
    
    %Train configuration
    maxEpochs = 40;
    config = trainingOptions(solverFcn,...
        'MaxEpochs',maxEpochs,...
        'GradientThreshold',1,...
        'Shuffle','never',...
        'Verbose',false,...
        'Plots','training-progress',...
        'ExecutionEnvironment','cpu');

    %Train network
    network = trainNetwork(data, target, layers, config);    
end