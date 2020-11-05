function [network,output] = trainLRN(data,trainF, neuronsN, hLayersN, transferF)
    
    %Get balanced data
    dataB = balanceData(data);
    target = createTarget(dataB);
    
    %***** Usar aqui autoenconder *****

    %----------->Define NN architecture
    %layrecnet arguments: [layerDelays,hiddenSizes,trainFcn]
    %Default-> layerDelays=1:2, hiddenSizes=10 h layers, trainFcn ='train lm'
    layerDelays = 1:2;          
    hiddenLayers = zeros(1, hLayersN);
    hiddenLayers(1,:) = neuronsN;
    net = layrecnet(layerDelays,hiddenLayers,trainF);

    %Transfer function
    for i = 1: hLayersN
        net.layers{i}.transferFcn = transferF;
    end
    
    %Train parameters
    net.trainParam.lr = 0.01;
    net.performFcn = 'msereg';
    %net.performParam.regularization = 0.4;

    %Stopping Criteria
    net.trainParam.min_grad = 1e-9;
    net.trainParam.max_fail = 100;
    net.trainParam.goal = 1e-9;
    net.trainParam.epochs = 1000;
    
    %Divisão do Set Balanceado para treino e validação
    net.divideFcn = 'divideblock';
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;
    
    [~,C] = size(target);
    interIctalL = nnz(all(target==[1 0 0]'));
    preIctalL = nnz(all(target==[0 1 0]'));
    ictalL = nnz(all(target==[0 0 1]'));
    
    %Calculate de error weight matrix
    EW = all(target==[1 0 0]')*(C/interIctalL) + all(target==[0 1 0]')*(C/preIctalL) + all(target==[0 0 1]')*(C/ictalL);    
    
    %view(net)
    network = train(net,dataB.FeatVectSel,target,[],[],EW);
    output = network(dataB.FeatVectSel);
    %perf = perform(network,y,target,EW); 
end

