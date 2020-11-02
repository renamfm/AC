net=patternnet(10);
net.trainFcn='trainscg';


net.performParam.lr = 0.01;     % learning rate| default value is 0.01
net.trainParam.epochs = 1000;     % The default is 1000 
                                            % The number of epochs define the number of times that the learning algorithm will work trhough the entire training dataset. One epoch means that each sample in the training dataset has had an opportunity to update the internal model parameters
net.trainParam.show = 35;       % The default is 25 %show| Epochs between displays
net.trainParam.goal = 1e-6;     % The default is 0 %goal=objective Performance goal
net.performFcn = 'mse';%divide the block of data for train, validation and test


net.divideFcn = 'divideind';
net.divideParam.trainInd = 1:800; 
net.divideParam.valInd = 801:900;
net.divideParam.testInd = 901:1000;

net = init(net);
net = train(net, P, T);
test = net(testeFiltered);
test_result(test)