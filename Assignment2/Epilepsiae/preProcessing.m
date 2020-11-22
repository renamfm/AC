clear all

path = 'C:\EpilepsaeData\';
% path = '/home/sergio/Dropbox/AC/PL2/Data/';

data1 = load(strcat(path, '54802.mat'));
data2 = load(strcat(path, '112502.mat'));


% data1 = preprocessingShallow('54802.mat', 0);
% data2 = preprocessingShallow('112502.mat', 0);
% 
% data1Simple3 = preprocessingShallow('54802.mat', 1);
% data2Simple3 = preprocessingShallow('112502.mat', 1);
% 
% data1Simple10 = preprocessingShallow('54802.mat', 2);
% data2Simple10 = preprocessingShallow('112502.mat', 2);
% 
% % data1Stack = preprocessingShallow('54802.mat', 3);
% % data2Stack = preprocessingShallow('112502.mat', 3);
% 
% save(strcat(path, 'data1.mat'), 'data1');
% save(strcat(path, 'data2.mat'), 'data2');
% save(strcat(path, 'data1Simple3.mat'), 'data1Simple3');
% save(strcat(path, 'data2Simple3.mat'), 'data2Simple3');
% save(strcat(path, 'data1Simple10.mat'), 'data1Simple10');
% save(strcat(path, 'data2Simple10.mat'), 'data2Simple10');
% % save(strcat(path, 'data1Stack.mat'), 'data1Stack');
% % save(strcat(path, 'data2Stack.mat'), 'data2Stack');


%Para gerar os dados a usar na GUI

%To transpose FeatVectSel and change classification in Trg

data1 = changeData(data1);
data2 = changeData(data2);

[autoenc1_3, features1_3] = simpleAutoencoder(data1.FeatVectSel, 3);
[autoenc1_10, features1_10] = simpleAutoencoder(data1.FeatVectSel, 10);
[autoenc2_3, features2_3] = simpleAutoencoder(data2.FeatVectSel, 3);
[autoenc2_10, features2_10] = simpleAutoencoder(data2.FeatVectSel, 10);

save(strcat(path, 'autoenc1_3.mat'), 'autoenc1_3');
save(strcat(path, 'features1_3.mat'), 'features1_3');
save(strcat(path, 'autoenc1_10.mat'), 'autoenc1_10');
save(strcat(path, 'features1_10.mat'), 'features1_10');
save(strcat(path, 'autoenc2_3.mat'), 'autoenc2_3');
save(strcat(path, 'features2_3.mat'), 'features2_3');
save(strcat(path, 'autoenc2_10.mat'), 'autoenc2_10');
save(strcat(path, 'features2_10.mat'), 'features2_10');