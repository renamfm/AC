%first, load data already classified
%changeData.......


%================ SHALLOW NETS (feedforward and recurrent) ===============%

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
hiddenSizes = 1;

%before this, change trainFcn above
net = feedforward(X, T, hiddenSizes, trainFcn);


%Recurrent nets

%CNN nets

%LSTM nets
