function new_population = crossover(population)
    new_population = ones(1, 2*length(population));
    if (mod(length(population),2) == 0)
        iterations = lenght(population);
    else
        iterations = lenght(population) - 1;    
    end
    
    for i = 1:2:iterations
       [resistors1 operations2] = circuit_from_tree(population(i));
       [resistors2 operations2] = circuit_from_tree(population(i + 1));
       
       msize = numel(resistors1);
       res = resistors(randperm(msize, length(resistors1)/2))
       [first_child indices] = intersect(resistors1, res)
       second_child = 
    end
end