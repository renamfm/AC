function Y = myclassify(data,filled_inx)
    % associative memory
    
    %binary perceptron
    
    %classifier
    load('Data/net.mat');   %Load trained network
    
    Y = net(data);
    [~, I] = max(Y);
    Y = I(filled_inx);
end