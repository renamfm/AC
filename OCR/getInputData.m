function getInputData()
    close all
    clear

    %File Names
    filenames = {'Data/P1_Renato.mat', 'Data/P1_Sergio.mat', 'Data/P2_Renato.mat', 'Data/P2_Sergio.mat', ...
        'Data/P3_Renato.mat', 'Data/P3_Sergio.mat', 'Data/P4_Renato.mat', 'Data/P4_Sergio.mat', ...
        'Data/P5_Renato.mat', 'Data/P5_Sergio.mat', 'Data/P6_Renato.mat', 'Data/P6_Sergio.mat', ...
        'Data/P7_Renato.mat', 'Data/P7_Sergio.mat', 'Data/P8_Renato.mat', 'Data/P8_Sergio.mat', ...
        'Data/P9_Renato.mat', 'Data/P9_Sergio.mat', 'Data/P10_Renato.mat', 'Data/P10_Sergio.mat'};

    for i = 1:numel(filenames)
        load(filenames{i});
    end

    %concatenar todos os numeros
    numbers = [P1_Renato, P1_Sergio, P2_Renato, P2_Sergio, P3_Renato, P3_Sergio, ...
        P4_Renato, P4_Sergio, P5_Renato, P5_Sergio, P6_Renato, P6_Sergio, ... 
        P7_Renato, P7_Sergio, P8_Renato, P8_Sergio, P9_Renato, P9_Sergio, ...
        P10_Renato, P10_Sergio];


    save('Data/numbers.mat', 'numbers');
    clear
end