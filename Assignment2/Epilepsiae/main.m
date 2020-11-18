clear all

%path = 'C:\EpilepsaeData\';
 path = '/home/sergio/Dropbox/AC/PL2/Data/';

%First, load data already classified (and reduced)

%data = load(strcat(path, 'data1.mat')).data1;
% data = load(strcat(path, 'data2.mat'));
% data = load(strcat(path, 'data1Simple3.mat'));
% data = load(strcat(path, 'data2Simple3.mat'));
% data = load(strcat(path, 'data1Simple10.mat'));
% data = load(strcat(path, 'data2Simple10.mat'));
% data = load(strcat(path, 'data1Stack.mat'));
% data = load(strcat(path, 'data2Stack.mat'));

load(strcat(path, 'data1.mat')); 
%load(strcat(path, 'data2.mat')); data = data2;
%load(strcat(path, 'data1Simple3.mat')); data = data1Simple3;
%load(strcat(path, 'data2Simple3.mat')); data = data2Simple3;
%load(strcat(path, 'data1Simple10.mat')); data = data1Simple10;
%load(strcat(path, 'data2Simple10.mat')); data = data2Simple10;
%load(strcat(path, 'data1Stack.mat')); data = data1Stack;
%load(strcat(path, 'data2Stack.mat')); data = data2Stack;


%dataTraining = data.dataTraining;
%dataTesting = data.dataTesting;




%================ SHALLOW NETS (feedforward and recurrent) ===============%

%Transfer functions
%transferFcn = 'logsig';    %sigmoidal
transferFcn = 'purelin';    %linear
%transferFcn = 'tansig';    %tangent sigmoidal?

  
%Training functions (from the feedforwardnet Matlab Documentation)
%trainFcn = 'trainlm';       %Levenberg-Marquardt
%trainFcn = 'trainbr';      %Bayesian Regularization
%trainFcn = 'trainbfg';     %BFGS Quasi-Newton
%trainFcn = 'trainrp';      %Resilient Backpropagation
%trainFcn = 'trainscg';     %Scaled Conjugate Gradient
trainFcn = 'traincgb';     %Conjugate Gradient with Powell/Beale Restarts
%trainFcn = 'traincgf';     %Fletcher-Powell Conjugate Gradient
%trainFnc = 'traincgp';     %Polak-Ribiere Conjugate Gradient
%trainFnc = 'trainoss';     %One Step Secant
%trainFnc = 'traingdx';     %Variable Learning Rate Gradient Descent
%trainFnc = 'traingdm';     %Gradient Descent with Momentum
%trainFnc = 'traingd';      %Gradient Descent

%=========================== Feedforward nets ============================%

% %before training, change trainFcn above
% network = trainFeedForwardN(dataTraining.FeatVectSel, dataTraining.Trg, trainFcn, 10, 1, transferFcn, 0, 0, 1);
% 
% %test the network
% output = network(dataTesting.FeatVectSel);
% 
% %get performance
% [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', dataTesting.Trg, output); %point by point
% [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', dataTesting.Trg, output); %Seizure by seizure

%============================ Recurrent nets =============================%

%before training, change trainFcn above
%network = trainLRN(dataTraining.FeatVectSel, dataTraining.Trg, trainFcn, 10, 1, transferFcn, 0, 0, 0);

%test the network
%output = network(dataTesting.FeatVectSel);

%get performance
%[SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', dataTesting.Trg, output); %point by point
%[SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', dataTesting.Trg, output); %Seizure by seizure


%=============================== CNN nets ================================
data = preProcessingDeep('54802.mat', 0);
dataTraining = data.dataTraining;
dataTesting = data.dataTesting;
%Preprocessing is inside training
[network] = trainCNN(dataTraining,'average','adam');
%preprocessin target
dataTesting = preProcessingCNN(dataTesting);
output = classify(network,dataTesting.FeatVectSel);
[SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Deep', dataTesting.Trg, output); %point by point
[SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Deep', dataTesting.Trg, output); %Seizure by seizure
%============================== LSTM nets ================================%
% data = preProcessingDeep('54802.mat', 0);
% dataTraining = data.dataTraining;
% dataTesting = data.dataTesting;
% [network] = trainLSTM(dataTraining,10,'adam');
% [~, data, target] = preProcessingLSTM(dataTesting.FeatVectSel,dataTesting.Trg);
% output = classify(network,data);
% [SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Deep', target, output); %point by point
% [SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Deep', target, output); %Seizure by seizure