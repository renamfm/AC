function [network] = trainCNN(data,poolType,solverFcn)
    data4D = preProcessingCNN(data);
    data = data4D.FeatVectSel;
    target = data4D.Trg;
    
    [features,~,~,~] = size(data);
    poolSize = 2; 
    poolStride = 2;
    layerStride = 2;
    
    if isequal(poolType,'average')
        poolingLayers = averagePooling2dLayer(poolSize,'Stride',poolStride);
    end
    if isequal(poolType, 'max')
        poolingLayers = maxPooling2dLayer(poolSize,'Stride',poolStride);
    end
    
    layers = [
    imageInputLayer([features features 1])  
    convolution2dLayer(5,16,'Stride',layerStride,'Padding','same')
    batchNormalizationLayer
    tanhLayer
    poolingLayers
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    tanhLayer
    poolingLayers
    convolution2dLayer(3,64,'Padding','same')
    batchNormalizationLayer
    tanhLayer
    poolingLayers
    fullyConnectedLayer(3)
    softmaxLayer
    classificationLayer];
    

    %Network configuration
    maxEpochs = 100;
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