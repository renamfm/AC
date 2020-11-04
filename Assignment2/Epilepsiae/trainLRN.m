function [network] = trainLRN(data)
    
    dataB = balanceData(data);
    target = createTarget(dataB);
    
    %***** Usar aqui autoenconder *****

    %layrecnet arguments: [layerDelays,hiddenSizes,trainFcn]
    %Default-> layerDelays=1:2, hiddenSizes=10 h layers, trainFcn ='train lm'
    layerDelays = 1:2;          
    hiddenLayersSize = 2;
    trainFcn = 'trainlm';
    net = layrecnet(layerDelays,hiddenLayersSize,trainFcn);
%     [Xs,Xi,Ai,Ts] = preparets(net,dataB.FeatVectSel,{},target);
    %network = train(net,data.FeatVectSel,dataT,'UseParallel','yes','UseGPU','yes');
%     net = train(net,Xs,Ts,Xi,Ai);
%     Y = net(Xs,Xi,Ai);
%     plot(cell2mat(Y))
%     perf = perform(net,Y,Ts)
     view(net)
     network = train(net,dataB.FeatVectSel,target,[],[]);
     y = network(dataB.FeatVectSel)
     plot(cell2mat(y))   
end

