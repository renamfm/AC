function data = change_data(data)
    data.FeatVectSel = data.FeatVectSel';

    %First, change ictal points from 1 to 3
    for i=1:size(data.Trg)
        if data.Trg(i) == 1
            data.Trg(i) = 3;
        end
    end

    %The 900 points before each seizure define the pre-ictal.
    %The 300 points after define the pos-ictal. 
    %However, pos-ictal will be considered part of inter-ictal.
    
    %So, :
    %   change the 900 seconds before each ictal to 2
    %   change the remaining points with value 0 to 1
    for i=1:size(data.Trg)
        if data.Trg(i) == 3 && data.Trg(i-1) ~= 3
            %disp("Begin:" + i); %first second of the seizure -> ictal begins
            for j=i-900:i-1
                data.Trg(j) = 2;
            end
        end
%         if data.Trg(i) == 3 && data.Trg(i+1) ~= 3
%             disp("End:" + i); %last second of the seizure -> ictal ends
%             for j=i+1:i+300
%                 data.Trg(j) = 1;
%             end
%         end
    end

    for i=1:size(data.Trg)
        if data.Trg(i) == 0
            data.Trg(i) = 1;
        end
    end

end

