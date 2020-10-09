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

net = network(1,1) %network with 1 input and 1 layer   
net = configure(net, P,T)



net = train(net,P,T); 

%final weights and bias after training phase
W = net.IW{1,1};
b = net.b{1,1};

%validation
load('P6_Sergio.mat'); %numeros que nao foram usados para treinar
test = net(P6_Sergio(:,15)); %test = sim(filterB,P6_Sergio(:,2)); %seria a mesma coisa