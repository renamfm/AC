function [SEp,SPp,SEs,SPs] = mainTest(patient, type, use)
    disp('-----TEST-----');
    X = ['Patient: ', patient]; disp(X);
    X = ['Type: ', type]; disp(X);
    X = ['For: ', use]; disp(X);
    
    network = [];
    
    if strcmp(patient,'54802')
        data = load('Data/54802.mat');
        data = changeData(data);
        
        if strcmp(type,'Feedforward')
            data = preprocessingShallow(data, 1);
            dataTesting = data.dataTesting;

            load('Data/netMultilayer54802.mat');
            output = network(dataTesting.FeatVectSel);
            
            %get performance
            [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', dataTesting.Trg, output); %point by point
            [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', dataTesting.Trg, output); %Seizure by seizure

        elseif strcmp(type,'Layer Recurrent')
            data = preprocessingShallow(data, 1);
            dataTesting = data.dataTesting;

            load('Data/netRecurrent54802.mat');
            output = network(dataTesting.FeatVectSel);

            %get performance
            [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', dataTesting.Trg, output); %point by point
            [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', dataTesting.Trg, output); %Seizure by seizure    

        elseif strcmp(type,'CNN')
            data = preProcessingDeep(data, 1);
            dataTesting = data.dataTesting;

            load('Data/cnnSgdm.mat');

            %Preprocessing target
            dataTesting = preProcessingCNN(dataTesting);
            output = classify(network,dataTesting.FeatVectSel);
            [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Deep', dataTesting.Trg, output); %point by point
            [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Deep', dataTesting.Trg, output); %Seizure by seizure

        elseif strcmp(type,'LSTM')
            data = preProcessingDeep(data, 1);
            dataTesting = data.dataTesting;

            load('Data/54802_lstm_2layer.mat');

            [~, data, target] = preProcessingLSTM(dataTesting.FeatVectSel,dataTesting.Trg);
            output = classify(network,data);
            [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Deep', target, output); %point by point
            [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Deep', target, output); %Seizure by seizure
        end
        
    elseif strcmp(patient,'112502')
        data = load('Data/112502.mat');
        data = changeData(data);
        
        if strcmp(type,'Feedforward')
            data = preprocessingShallow(data, 1);
            dataTesting = data.dataTesting;

            load('Data/netMultilayer112502.mat');
            output = network(dataTesting.FeatVectSel);
            
            %get performance
            [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', dataTesting.Trg, output); %point by point
            [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', dataTesting.Trg, output); %Seizure by seizure

        elseif strcmp(type,'Layer Recurrent')
            data = preprocessingShallow(data, 1);
            dataTesting = data.dataTesting;

            load('Data/netRecurrent112502.mat');
            output = network(dataTesting.FeatVectSel);
            
            %get performance
            [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', dataTesting.Trg, output); %point by point
            [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', dataTesting.Trg, output); %Seizure by seizure    

        elseif strcmp(type,'CNN')
            data = preProcessingDeep(data, 1);
            dataTesting = data.dataTesting;

            load('Data/112502_cnn_sgdm.mat');

            %Preprocessing target
            dataTesting = preProcessingCNN(dataTesting);
            output = classify(network,dataTesting.FeatVectSel);
            [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Deep', dataTesting.Trg, output); %point by point
            [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Deep', dataTesting.Trg, output); %Seizure by seizure

        elseif strcmp(type,'LSTM')
            data = preProcessingDeep(data, 1);
            dataTesting = data.dataTesting;
    
            load('Data/112502lstm_2layer.mat');
            
            [~, data, target] = preProcessingLSTM(dataTesting.FeatVectSel,dataTesting.Trg);
            output = classify(network,data);
            [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Deep', target, output); %point by point
            [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Deep', target, output); %Seizure by seizure
        end
        
    end
    
    
    if strcmp(use,'Detect')
        SEp = SE_Dp;
        SPp = SP_Dp;
        SEs = SE_Dss;
        SPs = SP_Ds;
    elseif strcmp(use,'Prevent')
        SEp = SE_Pp;
        SPp = SP_Pp;
        SEs = SE_Ps;
        SPs = SP_Ps;
    end
    
    
    
end


