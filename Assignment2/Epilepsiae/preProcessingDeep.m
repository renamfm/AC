function data = preProcessingDeep(data, autoencOption)
    %path = 'C:\EpilepsaeData\';
    path = '/home/sergio/Dropbox/AC/PL2/Data/';

    data = load(strcat(path, data));

    %To transpose FeatVectSel and change classification in Trg
    data = changeData(data);

    %Use autoencoder before dividing to make it less complicated
    if autoencOption == 1
        data.FeatVectSel = simpleAutoencoder(data.FeatVectSel, 3);
    elseif autoencOption == 2
        data.FeatVectSel = simpleAutoencoder(data.FeatVectSel, 10);
    elseif autoencOption == 3
        data.FeatVectSel = stackAutoencoder(data.FeatVectSel, data.Trg, 10, 6);
    end

    %Divide dataset into training, test and validation sets, 
    %considering the intended percentage of seizures pretended in each set
    %80% training+validation (85% training, 15% validation), 20% testing
    divIndex = datasetDivision(data);
    dataTraining = struct('FeatVectSel', data.FeatVectSel(:, 1:divIndex), 'Trg', data.Trg(1:divIndex, :));
    dataTesting = struct('FeatVectSel', data.FeatVectSel(:, divIndex+1:end), 'Trg', data.Trg(divIndex+1:end, :));

    %Balance data, if pretended (only for training)
    dataTraining = balanceData(dataTraining);
    
    data = struct('dataTraining', dataTraining, 'dataTesting', dataTesting);

end

