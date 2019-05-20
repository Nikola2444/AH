function [resistors, operations] = circuit_from_tree(circuit)
    resistors = ones(1, length(circuit.findleaves));
    operations = ones(1, length(circuit.findleaves) - 1);
    j = 1;
    k = 1;
    for i = 1:circuit.nnodes
%         if(circuit.isleaf(i) == 1)
%             resistors(i - length(circuit.findleaves) + 1) = circuit.get(i);
%         else
%             operations(i) = circuit.get(i);
%         end        
        if (circuit.get(i) > 0)
            resistors(j) = circuit.get(i);
            j = j + 1;
        else
            operations(k) = circuit.get(i);
            k = k + 1;
        end
    end
end