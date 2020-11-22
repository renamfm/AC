function [SE_Dp,SP_Dp,SE_Pp,SP_Pp,SE_Dss,SP_Ds,SE_Ps,SP_Ps] = mainTrainDeep(patient, autoencoder, classBalancing, validation, type, solver, layersLSTM, neuronsLSTM)
    disp('-----TRAIN SHALLOW-----');
    X = ['Patient: ', patient]; disp(X);
    X = ['Autoencoder: ', autoencoder]; disp(X);
    X = ['Class Balancing: ', classBalancing]; disp(X);
    X = ['Validation: ', validation]; disp(X);
    X = ['Type: ', type]; disp(X);
    X = ['Solver: ', solver]; disp(X);
    X = ['Layers (LSTM): ', layersLSTM]; disp(X);
    X = ['Neurons (LSTM): ', neuronsLSTM]; disp(X);
    
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
    
    data = preProcessingDeep(data, classBalancing);
    dataTraining = data.dataTraining;
    dataTesting = data.dataTesting;

    
    %data, target, trainF, neuronsN, hLayersN, transferF, divideOn, errorsOn, parallelOn
    %train intended network
    if strcmp(type,'CNN')
        %Preprocessing is inside training
        [network] = trainCNN(dataTraining,'average',solver);
        
        %Preprocessing target
        dataTesting = preProcessingCNN(dataTesting);
        output = classify(network,dataTesting.FeatVectSel);
        [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Deep', dataTesting.Trg, output); %point by point
        [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Deep', dataTesting.Trg, output); %Seizure by seizure

    elseif strcmp(type,'LSTM')
        [network] = trainLSTM(dataTraining,str2num(neuronsLSTM),'adam',str2num(layersLSTM));
        [~, data, target] = preProcessingLSTM(dataTesting.FeatVectSel,dataTesting.Trg);
        output = classify(network,data);
        [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Deep', target, output); %point by point
        [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Deep', target, output); %Seizure by seizure
    end
    
end

