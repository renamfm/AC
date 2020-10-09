function net = classifier()

%==========CLASSIFIER==========%
%DATASET
load('Data/numbers.mat');
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

net = network(1,1); %network with 1 input and 1 layer   
net.inputs{1}.size = 256; %single input with 256 values
net.layers{1}.size = 10; %single layer with 10 neurons (one for each class)

%connect input, bias and output to layer 1
net.inputConnect(1) = 1;
net.biasConnect(1) = 1;
net.outputConnect(1) = 1;

%view(net)

%---------------- Select activation function----------
%net.layers{1}.transferFcn = 'hardlim' %binary
net.layers{1}.transferFcn = 'purelin'; %linear
%net.layers{1}.transferFcn = 'logsig' %sigmoidal

%---------------- Select training function----------
net.trainFcn = 'trainlm'; %levenberg?marquardt
%net.trainFcn = 'traingd'; %gradient
%net.trainFcn = 'traingda'; %gradient descent with adaptive leaning rate
%net.trainFcn = 'traingdm'; %gradient with moment
%net.trainFcn = 'trainscg'; %scaled conjugate gradient 


%learing algorithm
net.adaptFcn = 'learnp';

%initialization of the network parameters
W = rand(10,256); %generates matrix 10x256 random in (0 1)
b = rand(10,1);
net.IW{1,1} = W;
net.b{1,1} = b;

%training parameters
net.performParam.lr = 0.5; % learning rate
net.trainParam.epochs = 1000; % maximum epochs
net.trainParam.show = 35; % show
net.trainParam.goal = 1e-6; % goal=objective
net.performFcn = 'sse'; % criterion
%net.performFcn = 'mse'; % criterion 

net = train(net,P,T); 
save('Data/net.mat', 'net')

%final weights and bias after training phase
W = net.IW{1,1};
b = net.b{1,1};

%validation
load('Data/P6_Sergio.mat'); %numeros que nao foram usados para treinar
test = net(P6_Sergio(:,1)); %test = sim(filterB,P6_Sergio(:,2)); %seria a mesma coisa

end
