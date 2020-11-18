function [network] = trainCNN(data,poolType,solverFcn)
    data4D = preProcessingCNN(data);
    data = data4D.FeatVectSel;
    target = data4D.Trg;
    
    [features,~,~,~] = size(data);
    filterSize = 5;
    numFilter = 5;
    poolSize = 2; %se aumentar este pa 4
    poolStride = 2;%se aumentar este pa 4
    layerStride = 2;%se aumentar este pa 4
    
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

    %Three convolution layers
    
    %Five convolution layers

    %Network configuration
    maxEpochs = 30;
    config = trainingOptions(solverFcn,...
        'MaxEpochs',maxEpochs,...
        'Shuffle','never',...
        'Verbose',false,...
        'InitialLearnRate', 0.001,...
        'Plots','training-progress',...
        'ExecutionEnvironment','cpu');
    
    %T = createTarget(data4D);
    network = trainNetwork(data, target, layers, config);
end