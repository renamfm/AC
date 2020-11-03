data1 = load('C:\EpilepsaeData\44202.mat');
data2 = load('C:\EpilepsaeData\54802.mat');
data3 = load('C:\EpilepsaeData\63502.mat');
data4 = load('C:\EpilepsaeData\112502.mat');

%Classification:
%   1 - Inter-ictal: [1 0 0]
%   2 - Pre-ictal:   [0 1 0]
%   3 - Ictal:       [0 0 1]

%To transpose FeatVectSel and change classification in Trg
data1 = change_data(data1);
data2 = change_data(data2);
data3 = change_data(data3);
data4 = change_data(data4);

target1 = createTarget(data1);