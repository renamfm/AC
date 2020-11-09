function [network] = trainLSTM(Data)
    %Change data
    Data = changeData(Data);
    %Assign data and target
    data = Data.FeatVectSel;
    target = Data.Trg;

    %----------Pre processing------------
    [~,C] = size(data);
    %We need to convert the data to a cell, num2cell does not work
    cell ={};
    for i=1:C
      cell{end+1,1} = data(:,i);  
    end
    data = cell;    %Just to be simpler
    %We can categorize like this since the array only has 1 row
    target = categorical(target');  
    
    %------------LSTM Implementation-----------
    
    
    
end