clear all

path = 'C:\EpilepsaeData\';
% path = '/home/sergio/Dropbox/AC/PL2/Data/';

%First, load data already classified
%load(strcat(path, 'data1Training.mat'));
%load(strcat(path, 'data1Testing.mat'));
%load(strcat(path, 'data2Training.mat'));
%load(strcat(path, 'data2Testing.mat'));

[data1Training,data1Testing] = preprocessingShallow('54802.mat');
[data2Training,data2Testing] = preprocessingShallow('112502.mat');


%================ SHALLOW NETS (feedforward and recurrent) ===============%

%Transfer functions
%transferFcn = 'hardlim';   %binary
transferFcn = 'purelin';    %linear
%transferFcn = 'logsig';    %sigmoidal
  
%Training functions (from the feedforwardnet Matlab Documentation)
trainFcn = 'trainlm';       %Levenberg-Marquardt
%trainFcn = 'trainbr';      %Bayesian Regularization
%trainFcn = 'trainbfg';     %BFGS Quasi-Newton
%trainFcn = 'trainrp';      %Resilient Backpropagation
%trainFcn = 'trainscg';     %Scaled Conjugate Gradient
%trainFcn = 'traincgb';     %Conjugate Gradient with Powell/Beale Restarts
%trainFcn = 'traincgf';     %Fletcher-Powell Conjugate Gradient
%trainFnc = 'traincgp';     %Polak-Ribiere Conjugate Gradient
%trainFnc = 'trainoss';     %One Step Secant
%trainFnc = 'traingdx';     %Variable Learning Rate Gradient Descent
%trainFnc = 'traingdm';     %Gradient Descent with Momentum
%trainFnc = 'traingd';      %Gradient Descent

%=========================== Feedforward nets ============================%

%change hiddenSizes
%hiddenSizes = 1;

%before training, change trainFcn above
network = trainFeedForwardN(data1Training.FeatVectSel, data1Training.Trg, trainFcn, 10, 1, transferFcn, 0, 0);

%test the network
output = network(data1Testing.FeatVectSel);

%get performance
[SE_Dp,SE_Pp,SP_Dp,SP_Pp] = getNNPerformPbP('Shallow', data1Testing.Trg, output); %point by point
[SE_Dss,SE_Ps,SP_Ds,SP_Ps] = getNNPerformSbS('Shallow', data1Testing.Trg, output); %Seizure by seizure


%============================ Recurrent nets =============================%


%=============================== CNN nets ================================%


%============================== LSTM nets ================================%
