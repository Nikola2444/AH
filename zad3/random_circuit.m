function [circuit] = random_circuit(num_of_resistors, E_24)
    Operations = randi([-1 0], 1, num_of_resistors - 1);
    R =  E_24(randi(numel(E_24), 1, num_of_resistors));
    circuit = [Operations R];
end


% msize = numel(resistors);
% res = resistors(randperm(msize, 4))
% [value indices] = intersect(resistors, res)