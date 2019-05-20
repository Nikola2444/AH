function Y = create_binary_tree(circuit)
    
    resistors = circuit(circuit > 0);
    operations = circuit(circuit <= 0);
    Y = tree(operations(1));
    i = 1;
    while(i < length(operations))
        
        index = randi([1 Y.nnodes], 1);
        if(length(Y.getchildren(index)) ~= 2)          
            i = i + 1;
            Y = Y.addnode(index, operations(i));
            
        end
        
    end
    Y = insert_res(Y, resistors, 1, 1);
    
    
end