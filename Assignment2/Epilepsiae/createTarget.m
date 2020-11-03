function [target] = createTarget(data)
    [R,~] = size(data.Trg);
    target = zeros(3,R);
    
    %Classification:
     interIctal = [1 0 0];
     preIctal = [0 1 0];
     ictal = [0 0 1];
     
     for i=1:R
        switch data.Trg(i)
            case 1
                target(:,i) = interIctal;
            case 2
                target(:,i) = preIctal;
            case 3
                target(:,i) = ictal;
        end
     end     
end