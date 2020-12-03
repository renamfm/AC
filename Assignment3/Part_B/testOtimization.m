function [bGridRes, bSubRes, bFcmRes, hGridRes, hSubRes, hFcmRes] = testOtimization(bGrid, bSub, bFcm,hGrid, hSub, hFcm, testData)
    input = testData(:,1:6); %The 7th column is the output
    output = testData(:,7);
    
    %__________________________________________________
    %Backpropagation GridPartition
    bGridRes.output = evalfis(bGrid, input);
    bGridRes.mse = immse(bGridRes.output, output);
    
    %Backpropagation SubtractiveClustering
    bSubRes.output = evalfis(bSub, input);
    bSubRes.mse = immse(bSubRes.output, output);
    
    %Backpropagation FCMClustering
    bFcmRes.output = evalfis(bFcm, input);
    bFcmRes.mse = immse(bFcmRes.output, output);
   
    %__________________________________________________
    %Hybrid GridPartition
    hGridRes.output = evalfis(hGrid, input);
    hGridRes.mse = immse(hGridRes.output, output);
    
    %Hybrid SubtractiveClustering
    hSubRes.output = evalfis(hSub, input);
    hSubRes.mse = immse(hSubRes.output, output);
    
    %Hybrid FCMClustering
    hFcmRes.output = evalfis(hFcm, input);
    hFcmRes.mse = immse(hFcmRes.output, output);
end