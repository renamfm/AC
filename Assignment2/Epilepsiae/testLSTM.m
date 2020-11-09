%function [network] = testLSTM()
data = load('/home/sergio/Dropbox/AC/PL2/Data/54802.mat');
%Change data function called on trainLSTM.m
network = trainLSTM(data);
%FIXME: result = classify(network,data.FeatVectSel);
%Put here the performance results
%end