function circuit = insert_rand_element(operation, resistor, E_24)
    
    mutation_res = E_24(randi(numel(E_24), 1));
    mutation_op = randi([-1 0], 1);
    add_rem_node = randi([0 1], 1);
    if (add_rem_node == 0  && length(resistor) > 3)
         if(length(resistor) < 2)
            resistor
            operation
            error("num of resistors less than 2")
            
        end
        place_res = randi([1 (length(resistor) - 1)], 1);
        place_op = randi([1 (length(operation) - 1)], 1);
        new_res = resistor(1:place_res-1);
        new_res = [new_res, mutation_res, resistor(place_res: length(resistor))];
        new_op = operation(1:place_op - 1);
        new_op = [new_op mutation_op operation(place_op :length(operation))];
        circuit = [new_op new_res];
    elseif (add_rem_node == 1 && length(resistor) > 3 )
        if(length(resistor) < 2)
            resistor
            operation
            error("num of resistors less than 2")
            
        end
        place_res = randi([1 (length(resistor) - 1)], 1);
        
        place_op = randi([1 (length(operation) - 1)], 1);
        new_res = resistor(1:place_res - 1);
        new_res = [new_res, resistor((place_res + 1): length(resistor))];
        new_op = operation(1:place_op - 1);
        new_op = [new_op, operation((place_op + 1) :length(operation))];
        circuit = [new_op new_res];
    else
        circuit = [operation resistor];
    end
    
    
end