%data1 = load('/home/sergio/Dropbox/AC/PL2/Data/54802.mat');
%data2 = load('/home/sergio/Dropbox/AC/PL2/Data/112502.mat');

data1 = load('C:\EpilepsaeData\54802.mat');
data2 = load('C:\EpilepsaeData\112502.mat');

%Classification:
%   1 - Inter-ictal: [1 0 0]
%   2 - Pre-ictal:   [0 1 0]
%   3 - Ictal:       [0 0 1]

%dividir o set em train e validacao, 85% <-> 15%| 30-20%
%so o training e que tem o balanceamento
%CNN podemos fazer mais ictal com overlap
%Mais usada é a ReLu mas podemos usar outras

%To transpose FeatVectSel and change classification in Trg
data1 = changeData(data1);
data2 = changeData(data2); 

data1 = balanceData(data1);
target1 = createTarget(data1);
features = simpleAutoencoder(data1.FeatVectSel, 10);
%features = stackAutoencoder(data1.FeatVectSel, 10, 6);

%data2 = balanceData(data2);
%target2 = createTarget(data2);
%features = simpleAutoencoder(data2.FeatVectSel, 10);
%features = stackAutoencoder(data2.FeatVectSel, 10, 6);
