%data1 = load('/home/sergio/Dropbox/AC/PL2/Data/44202.mat');
data2 = load('/home/sergio/Dropbox/AC/PL2/Data/54802.mat');
data3 = load('/home/sergio/Dropbox/AC/PL2/Data/63502.mat');
%data4 = load('/home/sergio/Dropbox/AC/PL2/Data/112502.mat');

%Classification:
%   1 - Inter-ictal: [1 0 0]
%   2 - Pre-ictal:   [0 1 0]
%   3 - Ictal:       [0 0 1]

%dividir o set em train e validacao, 85% <-> 15%| 30-20%
%so o training e que tem o balanceamento
%CNN podemos fazer mais ictal com overlap
%Mais usada é a ReLu mas podemos usar outras

%To transpose FeatVectSel and change classification in Trg
%data1 = change_data(data1);
data = change_data(data2);
data2 = change_data(data3);
%data4 = change_data(data4);

%data2 = balanceData(data2);
%target2 = createTarget(data2);
