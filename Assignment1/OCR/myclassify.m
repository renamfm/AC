function Y = myclassify(data,filled_inx)
    load('option.mat');
    
    switch option
        case 1
            disp("Option 1: only classifier, purelin, trainb, trainlm");
            load('Net/classifierPurelinTrainbTrainlm.mat', 'net');
        case 2
            disp("Option 2: only classifier, purelin, trainb, traingda");
            load('Net/classifierPurelinTrainbTraingda.mat', 'net');
        case 3
            disp("Option 3: only classifier, purelin, trainb, trainscg");
            load('Net/classifierPurelinTrainbTrainscg.mat', 'net');
        case 4
            disp("Option 4: only classifier, perceptron");
            load('Net/classifierPerceptron.mat', 'net');
        case 5
            disp("Option 5: assoc. mem. + classifier, purelin, trainb, trainlm");
            load('Net/assocPurelinTrainbTrainlm.mat', 'net');
        case 6
            disp("Option 6: assoc. mem. + classifier, purelin, trainb, trainscg");
            load('Net/assocPurelinTrainbTrainscg.mat', 'net');
        case 7
            disp("Option 7: assoc. mem. + classifier, purelin, trainb, traingda");
            load('Net/assocPurelinTrainbTraingda.mat', 'net');
        case 8
            disp("Option 8: assoc. mem. + classifier, perceptron");
            net = load('Net/assocPerceptron.mat');
        otherwise
            disp("NN not selected!")
    end
    
    %se for preciso usar assoc. memory
    if(option==5 || option==6 || option==7 || option==8)
        Wp = associativeMemory();
        data = Wp * data;
    end
    
    
    Y = net(data);
    [~, I] = max(Y);
    Y = I(filled_inx);
%end