function [network] = trainCNN(data)
    data4D = preProcessingCNN(data);
    data = data4D.FeatVectSel;
    target = data4D.Trg;
    
    [features,~,~,~] = size(data);
    filterSize = 5;
    numFilter = 5;
    poolSize = 2;
    poolStride = 2;
    layerStride = 2;
    poolType = 'average';
    
    if isequal(poolType,'average')
        poolingLayers = averagePooling2dLayer(poolSize,'Stride',poolStride);
    end
    if isequal(poolType, 'max')
        poolingLayers = maxPooling2dLayer(poolSize,'Stride',poolStride);
    end
    
    %Two convolution layers
    layers = [
    imageInputLayer([features features 1])  
    convolution2dLayer(filterSize,numFilter,'Stride',layerStride,'Padding','same')
    batchNormalizationLayer
    reluLayer    
    poolingLayers
    convolution2dLayer(filterSize,numFilter,'Padding','same')
    batchNormalizationLayer
    reluLayer 
    fullyConnectedLayer(3)
    softmaxLayer
    classificationLayer];

    %Network configuration
    config = trainingOptions('adam',...
        'InitialLearnRate', 0.01,...
        'Verbose',0,...
        'MaxEpochs',20,...
        'ExecutionEnvironment','cpu',...
        'Plots','training-progress');
    
    %T = createTarget(data4D);
    network = trainNetwork(data, target, layers, config);
end