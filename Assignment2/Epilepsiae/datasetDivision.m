function [divIndex] = datasetDivision(data)
    endOfSeizures = [];
    
    %search the points that belong to ictal phase
    ictalIndex = find(data.Trg(:,1) == 3);
    
    %To prevent the division in the middle of an seizure, find
    %the point of the end of each one
    %Our division of the data will be based on these points
    for i = 1:size(ictalIndex)-1
        if data.Trg(ictalIndex(i)+1) ~= 3
            endOfSeizures = [endOfSeizures ; ictalIndex(i)];
        end
    end
    i = size(ictalIndex, 1);
    endOfSeizures = [endOfSeizures ; ictalIndex(i)];
    
    %Divide dataset: training (0.8) and testing (0.2)
    divIndex = floor(size(endOfSeizures, 1) * 0.8);
    
    divIndex = endOfSeizures(divIndex);
end