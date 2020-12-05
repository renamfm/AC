%%>Get discrete trasfer function
%Our transfer function values
num = [2 3];
den = [1 2 2.5 1.25];
%Results
[numd, dend] = getDiscreteTF(num, den);


%%>Get input as shown in the assignment statement
output = sim('firstSimulation.slx');
discreteOut = output.DiscreteOut.Data;
inputRandom = output.InputRandom.Data;
tout =  output.tout;


%%>Now lets build the matrix
R = length(inputRandom)-3;
C = 7;
matrix = zeros(R,C);
%Now put the data according to the statement
%General: y(k) = f(y(k-1),y(k-2), y(k-3), u(k-1),u(k-2),u(k-3))
matrix(:,1) = discreteOut(3 : end-1); %y(k-1)
matrix(:,2) = discreteOut(2 : end-2); %y(k-2) 
matrix(:,3) = discreteOut(1: end-3);  %y(k-3)
matrix(:,4) = inputRandom(3 : end-1); %u(k-1)
matrix(:,5) = inputRandom(2 : end-2); %u(k-2)
matrix(:,6) = inputRandom(1: end-3);  %u(k-3)
matrix(:,7) = discreteOut(4:end);     %All output


%%>Make the clustering
%Create the dataset
%Acording to the statement 70% for training and 30% for testing
div = floor(0.7 * R);
trainData = matrix(1:div,:);
testData = matrix(div+1:end,:);
save('trainData');
save('testData');
save('trainData.dat','trainData','-ascii');
save('testData.dat','testData','-ascii');
%GUI Matlab command >>findcluster
%With find cluster we can choose between subtractive and fuzzy c-means
%To use kmeans we have to  use the command >>kmeans


%%>Or use the genfis function as explained in the statement (page 11)
%First assign the input and output
input = trainData(:,1:6); %First 6 colomns
output = trainData(:,7);  %output is the last colomn
%->GridPartition
options = genfisOptions('GridPartition');
grid = genfis(input, output, options);
%->SubtractiveClustering
options = genfisOptions('SubtractiveClustering');
sub = genfis(input, output, options);
%->FCMClustering
options = genfisOptions('FCMClustering');
fcm = genfis(input, output, options);


%>Train fis by hybrid or retropagation method
%Also sabe the best
%How to do it by cmd: >>[FIS,ERROR] = anfis(TRNDATA)
%Backpropagation Otimization
[bGrid, bSub, bFcm] = trainOtimization(grid, sub, fcm, 0, trainData);
%Hybrid Otimization
[hGrid, hSub, hFcm] = trainOtimization(grid, sub, fcm, 1, trainData);


%%>Test the trained sugfis
[bGridRes, bSubRes, bFcmRes, hGridRes, hSubRes, hFcmRes] = ...
    testOtimization(bGrid, bSub, bFcm,hGrid, hSub, hFcm, testData);

fprintf("GridPartition MSE: backP=%d, hybrid=%d\n",bGridRes.mse,hGridRes.mse);
fprintf("SubtractiveClustering MSE: backP=%d, hybrid=%d\n",bSubRes.mse,hSubRes.mse);
fprintf("FCMClustering MSE: backP=%d, hybrid=%d\n",bFcmRes.mse,hFcmRes.mse);


%%>Now do and run the simulation







