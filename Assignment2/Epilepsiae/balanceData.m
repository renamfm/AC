function [dataB] = balanceData(data)
    %Get the indexes of each class in order to balance the data
    interIctalIndex = find(data.Trg(:,1) == 1)';
    preIctalIndex = find(data.Trg(:,1) == 2)';
    ictalIndex = find(data.Trg(:,1) == 3)';

    %See how many preIctal and ictal indexes exist
    ictalRelatedN = length(preIctalIndex) + length(ictalIndex);
    
    %Get a random indexes from non ictal data in a quantity equal to
    %the sum of preIctal + ictal
    interIctalSelected =  randperm(length(interIctalIndex), ictalRelatedN);
    
    %Get the random indices chosen to balance the data
    interIctalChosen = interIctalIndex(1,interIctalSelected);
    
    %Sort all data by index
    sortedData = sort([ictalIndex preIctalIndex interIctalChosen]);
    
    %Now get the selected data
    dataB.FeatVectSel = data.FeatVectSel(:,sortedData);
    dataB.Trg = data.Trg(sortedData,:);
end