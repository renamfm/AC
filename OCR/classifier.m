%==========CLASSIFIER==========%
%DATASET
load('numbers.mat');
P = numbers;

%TARGET
t1 = [1 0 0 0 0 0 0 0 0 0]';
t2 = [0 1 0 0 0 0 0 0 0 0]';
t3 = [0 0 1 0 0 0 0 0 0 0]';
t4 = [0 0 0 1 0 0 0 0 0 0]';
t5 = [0 0 0 0 1 0 0 0 0 0]';
t6 = [0 0 0 0 0 1 0 0 0 0]';
t7 = [0 0 0 0 0 0 1 0 0 0]';
t8 = [0 0 0 0 0 0 0 1 0 0]';
t9 = [0 0 0 0 0 0 0 0 1 0]';
t0 = [0 0 0 0 0 0 0 0 0 1]';
 
T = [t1 t2 t3 t4 t5 t6 t7 t8 t9 t0];
 
for i = 1:49
    T = [T t1 t2 t3 t4 t5 t6 t7 t8 t9 t0];
end


%Creating the classifier

classif = network(1,1) %network with 1 input and 1 layer   
classif.inputs{1}.size = 256 %single input with 256 values
classif.layers{1}.size = 10 %single layer with 10 neurons (one for each class)

%connect input, bias and output to layer 1
classif.inputConnect(1) = 1
classif.biasConnect(1) = 1
classif.outputConnect(1) = 1

%view(classif)

%initialization of the network parameters
W = rand(10,256); %generates matrix 10x256 random in (0 1)
b = rand(10,1);
classif.IW{1,1} = W;
classif.b{1,1} = b;

%activation function
classif.layers{1}.transferFcn = 'hardlim' %binary

%set the training function
classif.trainFcn = 'trainc'

%learing algorithm
%classif.adapFcn = 'learn'

%training parameters
net.performParam.lr = 0.5; % learning rate
net.trainParam.epochs = 1000; % maximum epochs
net.trainParam.show = 35; % show
net.trainParam.goal = 1e-6; % goal=objective
net.performFcn = 'sse'; % criterion 

classif = train(classif,P,T); 

%final weights and bias after training phase
W = classif.IW{1,1};
b = classif.b{1,1};

%validation
load('P6_Sergio.mat'); %numeros que nao foram usados para treinar
test = classif(P6_Sergio(:,15)); %test = sim(filterB,P6_Sergio(:,2)); %seria a mesma coisa
