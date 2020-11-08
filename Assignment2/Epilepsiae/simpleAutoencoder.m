function features = simpleAutoencoder(X, nFeatures)

    %train autoencoder
    hiddenSize = nFeatures;
    autoenc = trainAutoencoder(X, hiddenSize, ...
        'L2WeightRegularization', 0.001, ...
        'SparsityRegularization', 4, ...
        'SparsityProportion', 0.05, ...
        'DecoderTransferFunction', 'purelin');
    
    %extract the n features
    features = encode(autoenc, X);
end

