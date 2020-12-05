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
   
   if(type == 0)
       name = 'backprop';
   else
       if(type == 1)
           name = 'hybrid';
       end
   end
   
   writeFIS(trainedGrid, strcat(name,'_grid'));
   writeFIS(trainedSub, strcat(name,'_sub'));
   writeFIS(trainedFcm, strcat(name,'_fcm'));  
end
