function [bGridRes, bSubRes, bFcmRes, hGridRes, hSubRes, hFcmRes] = testOtimization(bGrid, bSub, bFcm,hGrid, hSub, hFcm, testData)
    input = testData(:,1:6); %The 7th column is the output
    output = testData(:,7);
    L = length(output);
    
    %__________________________________________________
    %Backpropagation GridPartition
    bGridRes.output = evalfis(bGrid, input);
    bGridRes.mse = sum((output-bGridRes.output).^2)/L;
    
    %Backpropagation SubtractiveClustering
    bSubRes.output = evalfis(bSub, input);
    bSubRes.mse = sum((output-bSubRes.output).^2)/L;
    
    %Backpropagation FCMClustering
    bFcmRes.output = evalfis(bFcm, input);
    bFcmRes.mse = sum((output-bFcmRes.output).^2)/L;
   
    %__________________________________________________
    %Hybrid GridPartition
    hGridRes.output = evalfis(hGrid, input);
    hGridRes.mse = sum((output-hGridRes.output).^2)/L;
    
    %Hybrid SubtractiveClustering
    hSubRes.output = evalfis(hSub, input);
    hSubRes.mse = sum((output-hSubRes.output).^2)/L;
    
    %Hybrid FCMClustering
    hFcmRes.output = evalfis(hFcm, input);
    hFcmRes.mse = sum((output-hFcmRes.output).^2)/L;
end