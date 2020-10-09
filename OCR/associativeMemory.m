function Wp = associativeMemory()
load('Data/numbers.mat', 'numbers');
P1 = numbers;
T = getT();
Wp = T * pinv(P1);           %Weights
%P2 = Wp * P1;               %Output
end
