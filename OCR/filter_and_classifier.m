%Load dataset
load('numbers.mat');
P = numbers;

%Load perfect numbers
load('PerfectArial.mat');
%Build the target matrix
T = Perfect;
for i = 1:49
     T = [T Perfect];
end

%==========CREATE ASSOCIATIVE MEMORY AS FILTER==========%
%net = network
%%net.numInputs = 1
%net.numLayers = 1

%==========CREATE BINARY PERCEPTRON AS FILTER==========%
net = perceptron;
net = configure(net,P,T);
net.trainFcn = 'trainc';
net.adaptFcn = 'learnp';

%view(net)

net = train(net,P,T);

load('P6_Sergio.mat'); %Numbers that were not used for training

test = net(P6_Sergio(:,4)); %test = sim(net,P6_Sergio(:,2)); %seria a mesma coisa

showim(test)


%==========CLASSIFIER==========%
%TARGET
% t1 = [1 0 0 0 0 0 0 0 0 0]';
% t2 = [0 1 0 0 0 0 0 0 0 0]';
% t3 = [0 0 1 0 0 0 0 0 0 0]';
% t4 = [0 0 0 1 0 0 0 0 0 0]';
% t5 = [0 0 0 0 1 0 0 0 0 0]';
% t6 = [0 0 0 0 0 1 0 0 0 0]';
% t7 = [0 0 0 0 0 0 1 0 0 0]';
% t8 = [0 0 0 0 0 0 0 1 0 0]';
% t9 = [0 0 0 0 0 0 0 0 1 0]';
% t0 = [0 0 0 0 0 0 0 0 0 1]';
% 
% T = [t1 t2 t3 t4 t5 t6 t7 t8 t9 t0];
% 
% for i = 1:49
%     T = [T t1 t2 t3 t4 t5 t6 t7 t8 t9 t0];
% end