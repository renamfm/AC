function [SE_Dp,SP_Dp,SE_Pp,SP_Pp,SE_Dss,SP_Ds,SE_Ps,SP_Ps] = mainTrainShallow(patient, autoencoder, classBalancing, validation, type, transferFcn, trainingFcn, neurons, hiddenLayers, errorW)
    disp('-----TRAIN SHALLOW-----');
    X = ['Patient: ', patient]; disp(X);
    X = ['Autoencoder: ', autoencoder]; disp(X);
    X = ['Class Balancing: ', classBalancing]; disp(X);
    X = ['Validation: ', validation]; disp(X);
    X = ['Type: ', type]; disp(X);
    X = ['Transfer Function: ', transferFcn]; disp(X);
    X = ['Training Function: ', trainingFcn]; disp(X);
    X = ['Neurons: ', neurons]; disp(X);
    X = ['Hidden Layers: ', hiddenLayers]; disp(X);
    X = ['Error Weights: ', hiddenLayers]; disp(X);
    
    
    if strcmp(patient,'54802')
        data = load('Data/54802.mat');
        data = changeData(data);
        if strcmp(autoencoder,'3 features')
            load('Data/autoenc1_3.mat');
            data.FeatVectSel = encode(autoenc1_3, data.FeatVectSel);
        elseif strcmp(autoencoder,'10 features')
            load('Data/autoenc1_10.mat');
            data.FeatVectSel = encode(autoenc1_10, data.FeatVectSel);
        end
    elseif strcmp(patient,'112502')
        data = load('Data/112502.mat');
        data = changeData(data);
        if strcmp(autoencoder,'3 features')
            load('Data/autoenc2_3.mat');
            data.FeatVectSel = encode(autoenc2_3, data.FeatVectSel);
        elseif strcmp(autoencoder,'10 features')
            load('Data/autoenc2_10.mat');
            data.FeatVectSel = encode(autoenc2_10, data.FeatVectSel);
        end
    end
    
    
    if strcmp(classBalancing,'Yes')
        classBalancing = 1;
    else
        classBalancing = 0;
    end
    
    
    data = preprocessingShallow(data, classBalancing);
    dataTraining = data.dataTraining;
    dataTesting = data.dataTesting;

    
    if strcmp(validation,'Yes')
        validation = 1;
    else
        validation = 0;
    end
    
    if strcmp(trainingFcn,'trainscg')
        parallelComp = 1;
    else
        parallelComp = 0;
    end
    
    if strcmp(errorW,'Yes')
        errorW = 1;
    else
        errorW = 0;
    end
    
    
    %data, target, trainF, neuronsN, hLayersN, transferF, divideOn, errorsOn, parallelOn
    %train intended network
    if strcmp(type,'Feedforward')
        network = trainFeedForwardN(dataTraining.FeatVectSel, dataTraining.Trg, trainingFcn, str2num(neurons), str2num(hiddenLayers), transferFcn, validation, errorW, parallelComp);
        
        %test the network
        output = network(dataTesting.FeatVectSel);
        
        %get performance
        [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', dataTesting.Trg, output); %point by point
        [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', dataTesting.Trg, output); %Seizure by seizure

    elseif strcmp(type,'Layer Recurrent')
        network = trainLRN(dataTraining.FeatVectSel, dataTraining.Trg, trainingFcn, str2num(neurons), str2num(hiddenLayers), transferFcn, validation, errorW, parallelComp);

        %test the network
        output = network(dataTesting.FeatVectSel);

        %get performance
        [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', dataTesting.Trg, output); %point by point
        [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', dataTesting.Trg, output); %Seizure by seizure

    end
    
    %save('Data\netRecurrent54802.mat', 'network');
    
end
