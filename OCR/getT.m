function T = getT()
%Load perfect numbers
load('Data/PerfectArial.mat');

%Build the target matrix
T = Perfect
for i = 1:49
     T = [T Perfect];
end

end