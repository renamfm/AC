%DATASET
P = load('numbers.mat');

%TARGET
t1 = [1 0 0 0 0 0 0 0 0 0]'
t2 = [0 1 0 0 0 0 0 0 0 0]'
t3 = [0 0 1 0 0 0 0 0 0 0]'
t4 = [0 0 0 1 0 0 0 0 0 0]'
t5 = [0 0 0 0 1 0 0 0 0 0]'
t6 = [0 0 0 0 0 1 0 0 0 0]'
t7 = [0 0 0 0 0 0 1 0 0 0]'
t8 = [0 0 0 0 0 0 0 1 0 0]'
t9 = [0 0 0 0 0 0 0 0 1 0]'
t0 = [0 0 0 0 0 0 0 0 0 1]'

%CREATE ASSOCIATIVE MEMORY AS FILTER
%net = network
%%net.numInputs = 1
%net.numLayers = 1

%CREATE BINARY PERCEPTRON AS FILTER
filterB = perceptron;
filterB.trainFcn = 'trainc';
filterB.adapFcn = 'learnp';
