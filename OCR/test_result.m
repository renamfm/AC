function hit_ratio = test_result(input)

    num_col = size(input,2);
    target = createTarget(num_col);
    correct = 0;
    
    for column = 1:num_col
        [~, Iinput] = max(input(:,column));
        [~, Itarget] = max(target(:,column));
        if Iinput == Itarget
            %disp(Iinput)
            correct = correct+1;
        end
    end
    
    hit_ratio = correct*2;
end

