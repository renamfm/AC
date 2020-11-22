clear all

data1 = load('Data\54802.mat');
data2 = load('Data\112502.mat');

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