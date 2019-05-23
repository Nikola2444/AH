function new_population = crossover2(population)
    length(population)
    for i = 1:2:length(population)-1
        [resistors1, operations1] = circuit_from_tree(population(i));
        [resistors2, operations2] = circuit_from_tree(population(i + 1));
        
        %prvo dete
        if (randi([0 1], 1) == 0)
            resistors = [resistors1(1:floor(length(resistors1)/2)) resistors2(1:ceil(length(resistors2)/2))];
            if(length(resistors) == length(operations1))
                resistors = resistors(1:length(resistors)-1);
            end
            circuit1 = [operations1 resistors];
            new_population(i) = create_binary_tree(circuit1);
            
        else
            resistors = [resistors1(1:floor(length(resistors1)/2)) resistors2(1:ceil(length(resistors2)/2))];
            if(length(resistors) == length(operations2))
                resistors = resistors(1:length(resistors)-1);
            end
            circuit1 = [operations2 resistors];
            new_population(i) = create_binary_tree(circuit1);
        end
        
        %drugo dete
        if (randi([0 1], 1) == 0)
            resistors = [resistors1(1:floor(length(resistors1)/2)) resistors2(1:ceil(length(resistors2)/2))];
            if(length(resistors) == length(operations1))
                resistors = resistors(1:length(resistors)-1);
            end
            circuit1 = [operations1 resistors];
            new_population(i+1) = create_binary_tree(circuit1);
            
        else
            resistors = [resistors1(1:floor(length(resistors1)/2)) resistors2(1:ceil(length(resistors2)/2))];
            if(length(resistors) == length(operations2))
                resistors = resistors(1:length(resistors)-1);
            end
            circuit1 = [operations2 resistors];
            new_population(i+1) = create_binary_tree(circuit1);
        end
        
    end
end