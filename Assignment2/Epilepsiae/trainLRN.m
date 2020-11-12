function [network] = trainLRN(dataB,target,trainF, neuronsN, hLayersN, transferF,errorsOn)

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
    %net.performParam.regularization = 0.9;

    %Stopping Criteria
    net.trainParam.min_grad = 1e-9;
    net.trainParam.max_fail = 100;
    net.trainParam.goal = 1e-9;
    net.trainParam.epochs = 1000;
    
    %Divisão do Set Balanceado para treino e validação
    net.divideFcn = 'divideblock';
    net.divideParam.trainRatio = 0.85;
    net.divideParam.valRatio = 0.15;
    
    [~,C] = size(target);
    interIctalL = nnz(all(target==[1 0 0]'));
    preIctalL = nnz(all(target==[0 1 0]'));
    ictalL = nnz(all(target==[0 0 1]'));
    
    %Calculate de error weight matrix
    EW = all(target==[1 0 0]')*(C/interIctalL) + all(target==[0 1 0]')*(C/preIctalL) + all(target==[0 0 1]')*(C/ictalL);    
    
    %view(net)
    %FIX: Use Parallel Computing
    if(errorsOn == 1)
        network = layrecnet(net,dataB.FeatVectSel,target,[],[],EW);
    else
        network = layrecnet(net,dataB.FeatVectSel,target);
    end
end
