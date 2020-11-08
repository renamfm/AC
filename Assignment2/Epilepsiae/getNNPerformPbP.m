%This is a function to be used for all the networks
%The function calculates de sensivity and specificity for detection and
%prediction
%TODO: Ve se esta tudo bem!
function [SE_D,SE_P,SP_D,SP_P] = getNNPerformPbP(type, T, R)
    %If the network is a feedfoward of recurrent neural network
    if isequal(type, 'Shallow')
        [~,target] = max(T);
        [~,result] = max(R);
    end
    
    %How to know the predicted values performance?
    %->Use confionmat
    %C = confusionmat(group,grouphat) returns the confusion matrix C 
    %determined by the known and predicted groups in group and grouphat, respectively.
    cm = confusionmat(target,result);
    confusionchart(cm);
    %Tipo os indices diagonais sao os que foram classificados corretamente
    %para cada classe os outros foram classificados como de outro tipo
    %Cada coluna representa uma classe
    
    %Create new matrix's in order to store the true positive and false
    %positives
    
    [~,C] = size(cm);
    TP = zeros(1,C);    %True positives
    FP = zeros(1,C);    %False positives
    TN = zeros(1,C);    %True negatives
    FN = zeros(1,C);    %False negatives
    
    %Go throught matrix columns to calculate de positives and negatives
    for i=1:C
       TP(i) = cm(i,i);   %Diagonal values -> Classified correctly
       FP(i) = -cm(i,i) + sum(cm(:,i)); %FP -> All from line except the digonal
       FN(i)= -cm(i,i) + sum(cm(i,:)); %FP -> All from colonm except the digonal
       TN(i) = -TP(i)-FP(i)-FN(i)+sum(cm(:));
    end
    
    %Prediction Index 2 -> PreIctal
    %Detection Index 3 -> Ictal
    SE_D = TP(3)/(TP(3)+FN(3));
    SE_P = TP(2)/(TP(2)+FN(2));
    SP_D = TN(3)/(TN(3)+FP(3));    
    SP_P = TN(2)/(TN(2)+FP(2));

end