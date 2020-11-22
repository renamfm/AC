function data = preprocessingShallow(data, balance)
    %Divide dataset into training, test and validation sets, 
    %considering the intended percentage of seizures pretended in each set
    %80% training+validation (85% training, 15% validation), 20% testing
    divIndex = datasetDivision(data);
    dataTraining = struct('FeatVectSel', data.FeatVectSel(:, 1:divIndex), 'Trg', data.Trg(1:divIndex, :));
    dataTesting = struct('FeatVectSel', data.FeatVectSel(:, divIndex+1:end), 'Trg', data.Trg(divIndex+1:end, :));

    %Balance data, if pretended (only for training)
    if balance == 1
        dataTraining = balanceData(dataTraining);
    end

    %Target in a form that can be used by the NN's
    dataTraining.Trg = createTarget(dataTraining);
    dataTesting.Trg = createTarget(dataTesting);
    
    data = struct('dataTraining', dataTraining, 'dataTesting', dataTesting);

end

