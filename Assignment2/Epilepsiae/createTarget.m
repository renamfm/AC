function [target] = createTarget(data)
    [R,~] = size(data.Trg);
    target = [];
    
    %Classification:
     interIctal = [1 0 0]';
     preIctal = [0 1 0]';
     ictal = [0 0 1];
     
     for i=1:R
        switch data.Trg(i)
            case 1
                target = [target interIctal];
            case 2
                target = [target preIctal];
            case 3
                target = [target ictal];
        end
     end     
end