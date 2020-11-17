clear all

path = 'C:\EpilepsaeData\';
% path = '/home/sergio/Dropbox/AC/PL2/Data/';

load(strcat(path, '54802.mat'));
load(strcat(path, '112502.mat'));


% data1 = preprocessingShallow('54802.mat', 0);
% data2 = preprocessingShallow('112502.mat', 0);
% 
% data1Simple3 = preprocessingShallow('54802.mat', 1);
% data2Simple3 = preprocessingShallow('112502.mat', 1);
% 
% data1Simple10 = preprocessingShallow('54802.mat', 2);
% data2Simple10 = preprocessingShallow('112502.mat', 2);

data1Stack = preprocessingShallow('54802.mat', 3);
data2Stack = preprocessingShallow('112502.mat', 3);

% save(strcat(path, 'data1.mat'), 'data1');
% save(strcat(path, 'data2.mat'), 'data2');
% save(strcat(path, 'data1Simple3.mat'), 'data1Simple3');
% save(strcat(path, 'data2Simple3.mat'), 'data2Simple3');
% save(strcat(path, 'data1Simple10.mat'), 'data1Simple10');
% save(strcat(path, 'data2Simple10.mat'), 'data2Simple10');
save(strcat(path, 'data1Stack.mat'), 'data1Stack');
save(strcat(path, 'data2Stack.mat'), 'data2Stack');