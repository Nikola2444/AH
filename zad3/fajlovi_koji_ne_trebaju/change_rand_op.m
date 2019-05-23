function circuit = change_rand_op(tree_circuit, optimal_score)
    
%    index = randi([1 floor(tree_circuit.nnodes/2)], 1)
%     if (tree_circuit.get(index) == 0)
%         tree_circuit = tree_circuit.set(index, -1);
%     else
%         tree_circuit = tree_circuit.set(index, 0);
%     end
%     circuit = tree_circuit;
    i = 0;
    %disp(tree_circuit.tostring);
    leaves = tree_circuit.findleaves;
    index = randi([1 length(leaves)], 1);
    while(i == 0)
        parent = tree_circuit.getparent(leaves(index));
        parent;
        if (length(tree_circuit.getchildren(parent)) == 2)
                if (equivalent_res(tree_circuit) > optimal_score)
                    tree_circuit = tree_circuit.set(parent, -1);
                else
                    tree_circuit = tree_circuit.set(parent, 0);
                end
                
                
                %disp(tree_circuit.tostring);
                i = 1;                                    
        else
            
            index = randi([1 length(leaves)], 1) ;
        end
    end
    %disp(tree_circuit.tostring);
    circuit = tree_circuit;
% 