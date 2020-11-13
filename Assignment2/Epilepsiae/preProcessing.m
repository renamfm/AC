clear all

path = 'C:\EpilepsaeData\';
% path = '/home/sergio/Dropbox/AC/PL2/Data/';

data1 = load(strcat(path, '54802.mat'));
data2 = load(strcat(path, '112502.mat'));


%Classification:
%   1 - Inter-ictal: 1 <-> [1 0 0]'
%   2 - Pre-ictal:   2 <-> [0 1 0]'
%   3 - Ictal:       3 <-> [0 0 1]'


%To transpose FeatVectSel and change classification in Trg
data1 = changeData(data1);
data2 = changeData(data2);


%Use autoencoder berfore dividing to make it less complicated
%data1.FeatVectSel = simpleAutoencoder(data1.FeatVectSel, 10);
%data1.FeatVectSel = stackAutoencoder(data1.FeatVectSel, 10, 6);
%data2.FeatVectSel = simpleAutoencoder(data2.FeatVectSel, 10);
%data2.FeatVectSel = stackAutoencoder(data2.FeatVectSel, 10, 6);


%Divide dataset into training, test and validation sets, 
%considering the intended percentage of seizures pretended in each set
%80% training+validation (85% training, 15% validation), 20% testing

%Data 1
[ttIndex, vIndex] = datasetDivision(data1);
data1Training = struct('FeatVectSel', data1.FeatVectSel(:, 1:vIndex), 'Trg', data1.Trg(1:vIndex, :));
data1Validation = struct('FeatVectSel', data1.FeatVectSel(:, vIndex+1:ttIndex), 'Trg', data1.Trg(vIndex+1:ttIndex, :));
data1Testing = struct('FeatVectSel', data1.FeatVectSel(:, ttIndex+1:end), 'Trg', data1.Trg(ttIndex+1:end, :));

%Data 2
[ttIndex, vIndex] = datasetDivision(data2);
data2Training = struct('FeatVectSel', data2.FeatVectSel(:, 1:vIndex), 'Trg', data2.Trg(1:vIndex, :));
data2Validation = struct('FeatVectSel', data2.FeatVectSel(:, vIndex+1:ttIndex), 'Trg', data2.Trg(vIndex+1:ttIndex, :));
data2Testing = struct('FeatVectSel', data2.FeatVectSel(:, ttIndex+1:end), 'Trg', data2.Trg(ttIndex+1:end, :));


%Balance data, if pretended (only for training)
data1Training = balanceData(data1Training);
data2Training = balanceData(data2Training);


%Target in a form that can be used by the NN's
data1Training.Trg = createTarget(data1Training);
data1Validation.Trg = createTarget(data1Validation);
data1Testing.Trg = createTarget(data1Testing);

data2Training.Trg = createTarget(data2Training);
data2Validation.Trg = createTarget(data2Validation);
data2Testing.Trg = createTarget(data2Testing);



%DEPOIS TER CONTA TAMBÉM SE QUEREMOS FAZER PARA DETECTION OU PREDICITON
%alterando os error weights


save(strcat(path, 'data1Training.mat'), 'data1Training');
save(strcat(path, 'data1Validation.mat'), 'data1Validation');
save(strcat(path, 'data1Testing.mat'), 'data1Testing');
save(strcat(path, 'data2Training.mat'), 'data2Training');
save(strcat(path, 'data2Validation.mat'), 'data2Validation');
save(strcat(path, 'dataTesting.mat'), 'data2Testing');


%============ COISAS ESPECIFICAS DE OUTRAS REDES ===========%
%CNN podemos fazer mais ictal com overlap
%Mais usada é a ReLu mas podemos usar outras


