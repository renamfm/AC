function [SE_D,SE_P,SP_D,SP_P] = getNNPerformSbS(type, T, R)
    %If the network is a feedfoward of recurrent neural network
    if isequal(type, 'Shallow')
        [~,target] = max(T);
        [~,result] = max(R);
    end
    
    [~,C] = size(result);       %Get result size
    computedR = zeros(C,1);     %Make a new array to store the results
    for i=1:C
        %If it has 10 numbers ahead
        if(i+10 <= C)
            %Sees the dominant number type
            interN = length(find(result(i:i+9)==1));
            preN = length(find(result(i:i+9)==2));
            ictalN = length(find(result(i:i+9)==3));
            [max_class,index] = max([interN preN ictalN]);
                
            %If it has 5 or mores it detects a class
            if max_class >= 5
            	computedR(i)=index;
            else
                computedR(i)=result(i);
            end
           
            else
            %Everything stays the same    
            computedR(i)=result(i);
        end
    end
    
    %%Now lets process the results as proposed in the statement
    %A seizure is only predicted if one finds 10 consective points as
    %preictal and 10 consecutive points as ictal
    
    %How to know the predicted values performance?
    %->Use confusionmat
    %C = confusionmat(group,grouphat) returns the confusion matrix C 
    %determined by the known and predicted groups in group and grouphat, respectively.
    cm = confusionmat(target,computedR);
    confusionchart(cm);
    %Tipo os indices diagonais sao os que foram classificados corretamente
    %para cada classe os outros foram classificados como de outro tipo
    %Cada coluna representa uma classe
    
    [~,C] = size(cm);
    TP = zeros(1,C);    %True positives
    FP = zeros(1,C);    %False positives
    TN = zeros(1,C);    %True negatives
    FN = zeros(1,C);    %False negatives
    
    %Go throught matrix columns to calculate de positives and negatives
    for i=1:C
       TP(i) = cm(i,i);   %Diagonal values -> Classified correctly
       FP(i) = -TP(i) + sum(cm(:,i)); %FP -> All from line except the digonal
       FN(i)= -TP(i) + sum(cm(i,:));  %FP -> All from colonm except the digonal
       TN(i) = -TP(i)-FP(i)-FN(i)+sum(cm(:));   %Everything except positives and FN
    end
    
    %Prediction Index 2 -> PreIctal
    %Detection Index 3 -> Ictal
    SE_D = (TP(3)/(TP(3)+FN(3)))*100;
    SE_P = (TP(2)/(TP(2)+FN(2)))*100;
    SP_D = (TN(3)/(TN(3)+FP(3)))*100;    
    SP_P = (TN(2)/(TN(2)+FP(2)))*100;
end