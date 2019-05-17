function [resistors operations] = circuit_from_tree(circuit)
    resistors = ones(1, length(circuit.findleaves));
    operations = ones(1, length(circuit.findleaves) - 1);
    
    for i = 1:circuit.nnodes
        if(circuit.isleaf(i) == 1)
            resistors(i - 9) = circuit.get(i)
        else
            operations(i) = circuit.get(i)
        end        
    end
end