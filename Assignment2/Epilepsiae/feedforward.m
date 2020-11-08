function net = feedforward(X, T, hiddenSizes, trainFcn)

    %generate the feedforward network
    net = feedforwardnet(hiddenSizes, trainFcn);
    
    %train net with X and T
    net = train(net, x, t);
    
    view(net)
    
    
end

