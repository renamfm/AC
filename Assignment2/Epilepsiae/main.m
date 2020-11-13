clear all

path = 'C:\EpilepsaeData\';
% path = '/home/sergio/Dropbox/AC/PL2/Data/';

%First, load data already classified
load(strcat(path, 'data1Training.mat'));
load(strcat(path, 'data1Testing.mat'));
load(strcat(path, 'data2Training.mat'));
load(strcat(path, 'dataTesting.mat'));


%================ SHALLOW NETS (feedforward and recurrent) ===============%

%Transfer functions
%transferFcn = 'hardlim';   %binary
transferFcn = 'purelin';    %linear
%transferFcn = 'logsig';    %sigmoidal
  
%Training functions (from the feedforwardnet Matlab Documentation)
%trainFcn = 'trainlm';       %Levenberg-Marquardt
%trainFcn = 'trainbr';      %Bayesian Regularization
%trainFcn = 'trainbfg';     %BFGS Quasi-Newton
%trainFcn = 'trainrp';      %Resilient Backpropagation
trainFcn = 'trainscg';     %Scaled Conjugate Gradient
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

%before this, change trainFcn above
network = trainFeedForwardN(data1Training.FeatVectSel, data1Training.Trg, trainFcn, 29, 1, transferFcn, 0, 1);


%Recurrent nets

%CNN nets

%LSTM nets
