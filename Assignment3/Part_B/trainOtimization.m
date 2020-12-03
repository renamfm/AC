function [trainedGrid, trainedSub, trainedFcm] = trainOtimization(grid, sub, fcm, type, trainData)
   %Train with backpropagatio otimization
   %Gridpartition
   options = anfisOptions('OptimizationMethod', type,'InitialFIS',grid);
   trainedGrid = anfis(trainData, options);
   
   %Substractive
   options = anfisOptions('OptimizationMethod', type,'InitialFIS',sub);
   trainedSub = anfis(trainData, options);
   
   %FCM
   options = anfisOptions('OptimizationMethod', type,'InitialFIS',fcm);
   trainedFcm = anfis(trainData, options);  
end
