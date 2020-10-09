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


%==========CREATE BINARY PERCEPTRON AS FILTER==========%
net = perceptron;
net = configure(net,P,T);
net.trainFcn = 'trainc';
net.adaptFcn = 'learnp';

%view(net)

net = train(net,P,T);

load('P6_Sergio.mat'); %Numbers that were not used for training

test2 = net(P6_Sergio(:,1)); %test = sim(net,P6_Sergio(:,2)); %seria a mesma coisa

%showim(test)
