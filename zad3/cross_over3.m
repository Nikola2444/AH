function new_population = cross_over3(population)
    %new_population =  population(randperm(length(population)));
    new_population = population;

    iterations = length(population);
    if(mod(iterations,2) ~= 0)
        iterations = iterations - 1;
    end
    for i = 1:2:iterations
        child1 = create_child(population(i), population(i + 1));
        child2 = create_child(population(i), population(i + 1));
        new_population = [new_population child1 child2];
    end
end