function [network] = trainCNN(data,poolType,solverFcn,layersNum)
    data4D = preProcessingCNN(data);
    data = data4D.FeatVectSel;
    target = data4D.Trg;
    
    [features,~,~,~] = size(data);
    filterSize = 5; 
    filterSize2 = 5; 
    poolSize = 2; 
    poolStride = 2;
    layerStride = 2;
    
    if isequal(poolType,'average')
        poolingLayers = averagePooling2dLayer(poolSize,'Stride',poolStride);
    end
    if isequal(poolType, 'max')
        poolingLayers = maxPooling2dLayer(poolSize,'Stride',poolStride);
    end
    
    %Three convolution layers
    if (layersNum == 3)
    layers = [
    imageInputLayer([features features 1])  
    convolution2dLayer(filterSize,filterSize2,'Stride',layerStride,'Padding','same')
    batchNormalizationLayer
    reluLayer    
    poolingLayers
    convolution2dLayer(filterSize,filterSize2,'Padding','same')
    batchNormalizationLayer
    reluLayer
    convolution2dLayer(filterSize,filterSize2,'Padding','same')
    batchNormalizationLayer
    reluLayer 
    fullyConnectedLayer(3)
    softmaxLayer
    classificationLayer];
    
    else
        if (layersNum==5)
            layers = [...
                imageInputLayer([features features 1])  
                convolution2dLayer(filterSize,filterSize2,'Stride',layerStride,'Padding','same')
                batchNormalizationLayer
                reluLayer    
                poolingLayers
                convolution2dLayer(filterSize,filterSize2,'Padding','same')
                batchNormalizationLayer
                reluLayer
                convolution2dLayer(filterSize,filterSize2,'Padding','same')
                batchNormalizationLayer
                reluLayer
                convolution2dLayer(filterSize,filterSize2,'Padding','same')
                batchNormalizationLayer
                reluLayer
                convolution2dLayer(filterSize,filterSize2,'Padding','same')
                batchNormalizationLayer
                reluLayer 
                fullyConnectedLayer(3)
                softmaxLayer
                classificationLayer];
        end
    
    end

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