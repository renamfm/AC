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
    lstmLayer(neurons,'OutputMode','sequence')
    dropoutLayer(0.1)
    %lstmLayer(neurons,'OutputMode','sequence')
    lstmLayer(neurons,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

    %Train configuration
    maxEpochs = 60;
    config = trainingOptions(solverFcn,...
        'MaxEpochs',maxEpochs,...
        'LearnRateSchedule','piecewise', ...
        'GradientThreshold',1,...
        'Shuffle','never',...
        'Verbose',false,...
        'Plots','training-progress',...
        'ExecutionEnvironment','cpu');

    %Train network
    network = trainNetwork(data, target, layers, config);    
end