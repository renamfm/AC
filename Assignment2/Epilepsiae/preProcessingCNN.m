function [data4D] = preProcessingCNN(Data)
    %Get data and target matrix
    data = Data.FeatVectSel;
    target = Data.Trg;
    
    %Get each class indexes
    interIndex = find(target == 1);
    preIndex = find(target == 2);
    ictalIndex = find(target == 3);
    
    %Get the data
    inter = data(:,interIndex);
    preIctal = data(:,preIndex);
    ictal = data(:,ictalIndex);
    
    %Define a cell array to concat later and form a 4d matrix
    squares = {};    
    %Get features number in order to apply autoencoders later
    [features,~] = size(data);
    %Keep count of pre and ictal classes number 
    interN = 0;
    preIctalN = 0;
    ictalN = 0;
    
    %Put the preictal data
    n = length(preIndex);
    for i=1:features:n
        %There needs to be at least a certain number of data
        %Because the matrix needs to be square
        if (i + (features-1)) < n
            preIctalN = preIctalN + 1; %Increase counter
            %Put a square matrix at the end of the cell
            squares{end+1,1} = preIctal(:,i:i+(features-1));
        end   
    end
    
    %Do the same for ictal
    n = length(ictalIndex);
    for i=1:features:n
        %There needs to be at least a certain number of data
        %Because the matrix needs to be square
        if (i + (features-1)) < n
            ictalN = ictalN + 1; %Increase counter
            %Put a square matrix at the end of the cell
            squares{end+1,1} = ictal(:,i:i+(features-1));
        end   
    end
    
   
    %In order to balance the data we need to put as many interIctal
    %as pre + ictal
    n = length(interIndex);
    interSize = preIctalN + ictalN;
    for i=1:features:n
        %Since there are a lot more of interictal data we just have to fill
        %The cell with the same number of pre + ictal values
        if (interN < interSize) && ((i + (features-1)) < n)
            interN = interN + 1;
            squares{end+1,1} = inter(:,i:i+(features-1));
        end
    end
    
    %Get 4D data as refered in the statement
    data4D.FeatVectSel = cat(4, squares{:});
    data4D.Trg = cat(1, repmat(2,preIctalN,1), repmat(3,ictalN,1), ones(interN,1));
    data4D.Trg = categorical(data4D.Trg); %In order to use the funcion trainNetwork the
    %target data must be if clategorical type