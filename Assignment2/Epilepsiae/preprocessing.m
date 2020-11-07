%data1 = load('/home/sergio/Dropbox/AC/PL2/Data/54802.mat');
%data2 = load('/home/sergio/Dropbox/AC/PL2/Data/112502.mat');

data1 = load('C:\EpilepsaeData\54802.mat');
data2 = load('C:\EpilepsaeData\112502.mat');

%Classification:
%   1 - Inter-ictal: [1 0 0]
%   2 - Pre-ictal:   [0 1 0]
%   3 - Ictal:       [0 0 1]

%To transpose FeatVectSel and change classification in Trg
data1 = changeData(data1);
data2 = changeData(data2);

data1 = balanceData(data1);
target1 = createTarget(data1);
stackAutoencoder(data1.FeatVectSel, target1, 10, 6);
