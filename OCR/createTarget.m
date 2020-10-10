function Target = createTarget(numInput)

    t1 = [1 0 0 0 0 0 0 0 0 0]';
    t2 = [0 1 0 0 0 0 0 0 0 0]';
    t3 = [0 0 1 0 0 0 0 0 0 0]';
    t4 = [0 0 0 1 0 0 0 0 0 0]';
    t5 = [0 0 0 0 1 0 0 0 0 0]';
    t6 = [0 0 0 0 0 1 0 0 0 0]';
    t7 = [0 0 0 0 0 0 1 0 0 0]';
    t8 = [0 0 0 0 0 0 0 1 0 0]';
    t9 = [0 0 0 0 0 0 0 0 1 0]';
    t0 = [0 0 0 0 0 0 0 0 0 1]';

    T = []
    
    j = 1;
    
    for i = 1:numInput
        switch j
            case 1
                T = [T t1];
            case 2
                T = [T t2];
            case 3
                T = [T t3];
            case 4
                T = [T t4];
            case 5
                T = [T t5];
            case 6
                T = [T t6];
            case 7
                T = [T t7];
            case 8
                T = [T t8];
            case 9
                T = [T t9];
            case 10
                T = [T t0];
        end
        
        j = j+1;
        
        if j > 10
            j = j-10;
        end
    end
    
   Target = T;
end

