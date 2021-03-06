%function net = classifier()

    %Dataset
    load('Data/numbers.mat');
    P = numbers;
   
    
    %%****************** UNCOMMENT TO USE THE FILTER ******************
    %Associative memory
    Wp = associativeMemory();
    P = Wp * P;
    
    %Perceptron as Filter
    %... Make sure pFilter is trained...
    %load('Data/pFilter.mat', 'pFilter');
    %P = pFilter(P);
    %showim(P(:,15));
    
    %%*****************************************************************
    
    
    %Target
    T = createTarget(1000);

    
    %%********** CLASSIFIER COM 1 LAYER ***********************************
    
    %Creating the classifier
    net = network(1,1); %network with 1 input and 1 layer   
    net.inputs{1}.size = 256; %single input with 256 values
    net.layers{1}.size = 10; %single layer with 10 neurons (one for each class)

    %connect input, bias and output to layer 1
    net.inputConnect(1) = 1;
    net.biasConnect(1) = 1;
    net.outputConnect(1) = 1;

    %No caso específico do Perceptron, tentámos também com Perceptron
    %net = perceptron;
    %net = configure(net,P,T);
    %net.trainFcn = 'trainc';
    %net.adaptFcn = 'learnp';

    
    
    %%********** CLASSIFIER COM 2 LAYERS **********************************
    
%     %Creating the classifier
%     net = network(1,2); %network with 1 input and 1 layer   
%     net.inputs{1}.size = 256; %layer 1 input with 256 values
%     net.layers{1}.size = 15; %layer 1 with 15 neurons
%     net.layers{2}.size = 10; %layer 2 with 10 neurons (one for each class)
% 
%     %connect input, bias, layers and output
%     net.inputConnect = [1; 0];
%     net.biasConnect = [1 ; 1];
%     net.layerConnect = [0 0 ; 1 0];
%     net.outputConnect = [0 1];
    

    %view(net)

    %---------------- Select activation function----------
    %net.layers{1}.transferFcn = 'hardlim'; %binary
    net.layers{1}.transferFcn = 'purelin'; %linear
    %net.layers{1}.transferFcn = 'logsig'; %sigmoidal
    
    %Caso haja mais uma layer
    %net.layers{2}.transferFcn = 'hardlim' %binary
    %net.layers{2}.transferFcn = 'purelin'; %linear
    %net.layers{2}.transferFcn = 'logsig' %sigmoidal
    

    %---------------- Incremental training ----------
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
    
    
    %---------------- Batch training ----------
    %Weight and biases updated athe the end  of an entire pass through the input data
    
    %Training function
    net.trainFcn = 'trainb';
    
    %Learning algorithms are in batch implementation
    %net.trainFcn = 'traingd'; %gradient descent
    net.trainFcn = 'traingda'; %gradient descent with adaptive leaning rate
    %net.trainFcn = 'traingdm'; %gradient with moment
    %net.trainFcn = 'trainlm'; %Levenberg-Marquardt
    %net.trainFcn = 'trainscg'; %scaled conjugate gradient 
    
    %Initialization of the network parameters
    W = rand(10,256); %generates matrix 10x256 random in (0 1)
    b = rand(10,1);
    net.IW{1,1} = W;
    net.b{1,1} = b;
    
    %caso haja 2 layers
    %net.IW{1,1} = rand(15,256);
    %net.b{1,1} = rand(15,1);
    %net.LW{2,1} = rand(10,15);
    %net.b{2,1} = rand(10,1);

    %training parameters
    net.performParam.lr = 0.5; % learning rate
    net.trainParam.epochs = 1000; % maximum epochs
    net.trainParam.show = 35; % show
    net.trainParam.goal = 1e-6; % goal=objective
    net.performFcn = 'sse'; % criterion
    %net.performFcn = 'mse'; % criterion 
    
    %divides dataset into training, validation and testing sets
    net.divideFcn = 'divideind';
    net.divideParam.trainInd = 1:800; 
    net.divideParam.valInd = 801:900;
    net.divideParam.testInd = 901:1000;
    
    
    %***** ATENTION: Change the NN name before saving to avoid override ***
    net = train(net,P,T); 
    %save('Net/assocPurelinTrainbTraingda', 'net')

    %final weights and bias after training phase
    W = net.IW{1,1};
    b = net.b{1,1};

    %final weight and bias with 2 layers
    %W1 = net.IW{1,1};
    %b1 = net.b{1,1};
    %W2 = net.IW{2,1};
    %b2 = net.b{2,1};
    
    
    %----------------------Testing-----------------------------
    load('Pteste.mat');
    
    %caso não se use filtro
    %test = net(Pteste);
    
    %associative memory 
    Wp = associativeMemory();
    Pteste = Wp * Pteste;
    test = net(Pteste);
    
    %caso se use filtro perceptron
    %testeFiltered = pFilter(Pteste);
    %test = net(testeFiltered);
    
    test_result(test)
%end