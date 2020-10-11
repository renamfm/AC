%function net = classifier()

    %Dataset
    load('Data/numbers.mat');
    P = numbers;
    
    %Target
    T = createTarget(1000);


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

    %---------------- Incremental training ----------
    %Weight and bias learning rules with incremental updates after each presentation of an input
    
    %Training function
    %Incremental training 
    net.trainFcn = 'trainc'; %levenberg?marquardt %inputs are presented in cyclic order
    %net.trainFcn = 'trainr'; %inputs are presented in random order
    
    %Learning algorithms to use when training methods are incremental
    %net.adaptFcn = 'learnp'; %perceptron rule
    %net.adaptFcn = 'learnpn'; %normalized perceptron rule
    %net.adaptFcn = 'learngd'; %gradient rule
    %net.adaptFcn = 'learngdm'; %gradient rule improved with momentum
    %net.adaptFcn = 'learnh'; %hebb rule
    %net.adaptFcn = 'learnhd'; %hebb rule with decaying weight
    %net.adaptFcn = 'learnwh'; %Widrow-Hoff learning rule
    
    
    %---------------- Batch training ----------
    %Weight and biases updated athe the end  of an entire pass through the input data
    
    %Training function
    %net.trainFcn = 'trainb';
    
    %Learning algorithms are in batch implementation
    %net.trainFcn = 'traingd'; %gradient descent
    %net.trainFcn = 'traingda'; %gradient descent with adaptive leaning rate
    %net.trainFcn = 'traingdm'; %gradient with moment
    net.trainFcn = 'trainlm'; %Levenberg-Marquardt
    %net.trainFcn = 'trainscg'; %scaled conjugate gradient 

    
    
    %Initialization of the network parameters
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
    save('Data/classifier.mat', 'net')

    %final weights and bias after training phase
    W = net.IW{1,1};
    b = net.b{1,1};

    %validation
    load('Data/P6_Sergio.mat'); %numeros que nao foram usados para treinar
    test = net(P6_Sergio(:,1)); %test = sim(filterB,P6_Sergio(:,2)); %seria a mesma coisa

%end
