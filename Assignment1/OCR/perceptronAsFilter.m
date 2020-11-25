function pFilter = perceptronAsFilter()
    %Load dataset
    load('Data/numbers.mat');
    P = numbers;

    T = getT(); %get target matrix
    
    pFilter = perceptron;
    pFilter = configure(pFilter,P,T);
    pFilter.trainFcn = 'trainc';
    pFilter.adaptFcn = 'learnp';

    %view(filterB)

    pFilter = train(pFilter,P,T);

    save('Data/pFilter.mat', 'pFilter');

    %%========TEST
    %load('Data/P6_Sergio.mat'); %Numbers that were not used for training
    %test = pFilter(P6_Sergio(:,1)); %test = sim(filterB,P6_Sergio(:,2)); %seria a mesma coisa
    %showim(test)
end
