clear all

path = 'C:\EpilepsaeData\';
% path = '/home/sergio/Dropbox/AC/PL2/Data/';

%First, load data already classified
load(strcat(path, 'data1Training.mat'));
load(strcat(path, 'data1Validation.mat'));
load(strcat(path, 'data1Testing.mat'));
load(strcat(path, 'data2Training.mat'));
load(strcat(path, 'data2Validation.mat'));
load(strcat(path, 'dataTesting.mat'));

%In order to be used in the NN's, we will join training and validation sets
%Inside each function, the distinction will be made with 'divideblock'
data1TV = struct('FeatVectSel', [data1Training.FeatVectSel data1Validation.FeatVectSel], ...
    'Trg', [data1Training.Trg data1Validation.Trg]);

data2TV = struct('FeatVectSel', [data2Training.FeatVectSel data2Validation.FeatVectSel], ...
    'Trg', [data2Training.Trg data2Validation.Trg]);


%================ SHALLOW NETS (feedforward and recurrent) ===============%

%Transfer functions
%transferFcn = 'hardlim'; %binary
transferFcn = 'purelin'; %linear
%transferFcn = 'logsig'; %sigmoidal
  
%PERGUNTAR AO STOR SOBRE AS TRAINING FUNCTIONS!!!!!!!!!!!!!!!!!!!
%(a documentacao do matlab e o enunciado sugerem coisas diferentes)

%INCREMENTAL TRAINING
%Weight and bias learning rules with incremental updates after each presentation of an input

%Training function
%Incremental training 
%net.trainFcn = 'trainc'; %levenberg?marquardt %inputs are presented in cyclic order
%net.trainFcn = 'trainr'; %inputs are presented in random order

%Learning algorithms to use when training methods are incremental
%net.adaptFcn = 'learnp'; %perceptron rule
%net.adaptFcn = 'learnpn'; %normalized perceptron rule
%net.adaptFcn = 'learngd'; %gradient rule
%net.adaptFcn = 'learngdm'; %gradient rule improved with momentum
%net.adaptFcn = 'learnh'; %hebb rule
%net.adaptFcn = 'learnhd'; %hebb rule with decaying weight
%net.adaptFcn = 'learnwh'; %Widrow-Hoff learning rule
       

%BATCH TRAINING
%Weight and biases updated athe the end  of an entire pass through the input data

%Training function
net.trainFcn = 'trainb';

%Learning algorithms are in batch implementation
%net.trainFcn = 'traingd'; %gradient descent
net.trainFcn = 'traingda'; %gradient descent with adaptive leaning rate
%net.trainFcn = 'traingdm'; %gradient with moment
%net.trainFcn = 'trainlm'; %Levenberg-Marquardt
%net.trainFcn = 'trainscg'; %scaled conjugate gradient 
   

%=========================== Feedforward nets ============================%

%change hiddenSizes
%hiddenSizes = 1;

%before this, change trainFcn above
net = trainFeedForwardN(data1TV.FeatVectSel, data1TV.Trg, 'traingda', 29, 1, transferFcn, 0);


%Recurrent nets

%CNN nets

%LSTM nets
