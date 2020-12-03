function [bGrid, bSub, bFcm] = trainBackpropagation(grid, sub, fcm, trainData)
   %Train with backpropagatio otimization
   %Gridpartition
   options = anfisOptions('OptimizationMethod',0,'InitialFIS',grid);
   bGrid = anfis(trainData, options);
   
   %Substractive
   options = anfisOptions('OptimizationMethod',0,'InitialFIS',sub);
   bSub = anfis(trainData, options);
   
   %FCM
   options = anfisOptions('OptimizationMethod',0,'InitialFIS',fcm);
   bFcm = anfis(trainData, options);  
end
