%%>Get discrete trasfer function
%Our transfer function values
num = [2 3];
den = [1 2 2.5 1.25];
%Results
[numd, dend] = getDiscreteTF(num, den);


%%>Get input as shown in the assignment statement
output = sim('firstSimulation.slx');
discreteOut = output.DiscreteOut.Data;
inputRandom = output.InputRandom.Data;
tout =  output.tout;


%%>Now lets build the matrix
R = length(inputRandom)-3;
C = 7;
matrix = zeros(R,C);
%Now put the data according to the statement
%General: y(k) = f(y(k-1),y(k-2), y(k-3), u(k-1),u(k-2),u(k-3))
matrix(:,1) = discreteOut(3 : end-1); %y(k-1)
matrix(:,2) = discreteOut(2 : end-2); %y(k-2) 
matrix(:,3) = discreteOut(1: end-3);  %y(k-3)
matrix(:,4) = inputRandom(3 : end-1); %u(k-1)
matrix(:,5) = inputRandom(2 : end-2); %u(k-2)
matrix(:,6) = inputRandom(1: end-3);  %u(k-3)
matrix(:,7) = discreteOut(4:end);     %All output


%%>Make the clusterinn

