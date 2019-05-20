% this is a function that generates a binary tree that represents a
% circuit. Elements of the circuit and their connections are passed
% to the binary tree via circuit array parameter. In the array
%operations between resistors come first, and then come the values
%of the resistors

function res_tree = create_binary_tree(circuit)
    
    niz_res = circuit(circuit > 0);
    niz = circuit(circuit <= 0);
    [res_tree, index(1)] = tree(niz(1));
    j = 1;
    k = 2;
    for i = 2 : length(niz)
        if (mod(k,2) == 0)
            j = j + 1;
        end 
        [res_tree, index(k)] = res_tree.addnode(index(j - 1), niz(k));
        k = k + 1;
    end
    for i = 1: length(niz_res) 
        if (mod(k,2) == 0)
            j = j + 1;
        end 
        [res_tree, index(k)] = res_tree.addnode(index(j - 1), niz_res(k - length(niz)));
        k = k + 1;
    end
end