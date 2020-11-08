function features = stackAutoencoder(X, nFeatures1, nFeatures2)

    %train autoencoder
    hiddenSize = nFeatures1;
    autoenc1 = trainAutoencoder(X, hiddenSize, ...
        'L2WeightRegularization', 0.001, ...
        'SparsityRegularization', 4, ...
        'SparsityProportion', 0.05, ...
        'DecoderTransferFunction', 'purelin');
    
    %extract the n features
    features1 = encode(autoenc1, X);
    
    %train a second autoencoder with features1 as input
    %(there may be several autoencoder layers)
    hiddenSize = nFeatures2; %reduce this number (maybe add a new argument)
    autoenc2 = trainAutoencoder(features1, hiddenSize, ...
        'L2WeightRegularization', 0.001, ...
        'SparsityRegularization', 4, ...
        'SparsityProportion', 0.05, ...
        'DecoderTransferFunction', 'purelin', ...
        'ScaleData', false);
    
    %extract the new n features
    features2 = encode(autoenc2, features1);
    
    features = features2;
    
    %==================== POR ENQUANTO NAO E PRECISO =====================%
    
    %%train a softmax layer with features2
    %softnet = trainSoftmaxLayer(features2, T, 'LossFunction', 'crossentropy');
    
    %%stack (put together) all layers
    %deepnet = stack(autoenc1, autoenc2, softnet);
    
    %%train the network on wine data
    %deepnet = train(deepnet, X, T);
    
    %%see the classification results
    %type = deepnet(X);
    
    %%analyse results with confusion matrix
    %plotconfusion(T, type);
    
   
end

