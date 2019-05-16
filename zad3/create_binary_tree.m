% this is a function that generates a binary tree that represents a
% circuit. Elements of the circuit and their connections are passed
% to the binary tree via circuit array parameter. In the array
%operations between resistors come first, and then come the values
%of the resistors

function res_tree = create_binary_tree(circuit)
    num_of_res = length(circuit(circuit > 0));
    t = tree(circuit(1));
    j = 1;
    k = 1;
    for i = 2:ceil((log2(num_of_res))) + 1  
        leaves = t.findleaves();
        while (j <= length(leaves))
            k = k + 1;
            t = t.addnode(leaves(j), circuit(k));
            k = k + 1;
            t = t.addnode(leaves(j), circuit(k));
            j = j + 1;
        end
        j = 1;
    end
    res_tree = t;
end