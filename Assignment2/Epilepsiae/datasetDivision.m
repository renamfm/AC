function [trIndex, vIndex, ttIndex] = datasetDivision(data)
    [R,~] = size(data.Trg);
    
    trIndex = 1;
    %Divide the dataset: training (0.7) and testing (0.3)
    div = floor(R * 0.8);
    ttIndex = div+1;
    
    %Divide training: training (0.85) validation (0.15)
    vIndex = floor(div* 0.85);
end