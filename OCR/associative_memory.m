%Associative memory as filter
function P2 = associative_memory(P1, Target)
    Wp = Target * pinv(P1);     %Weights
    P2 = Wp * P1;               %Output
end
