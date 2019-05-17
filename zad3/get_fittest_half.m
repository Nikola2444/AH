function fittest_half = get_fittest_half(population, optimal_score)
    population_res = ones(1, length(population));
    population_res_sorted = ones(1, length(population));
    for i = 1:length(population)
        population_res(i) =  equivalent_res(population(i));
        optimum_diff(i) = abs(optimal_score - population_res(i));
    end
    [population_res_sorted, indices]= sort(optimum_diff);
    population = population(indices);
    population_res = population_res(indices);
    %fittest_half = population_res([1: length(population_res)/2])
    fittest_half = population([1: length(population_res)/2])
    
end