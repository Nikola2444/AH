function selected = selection(population, optimal_score)
    population_res = ones([1 length(population)]);
    optimum_diff = ones([1 length(population)]);
    for i = 1:length(population)
        
        %equivalent_res(population(i))
%        disp(population(i).tostring);
        population_res(i) =  equivalent_res(population(i));
        optimum_diff(i) = (abs(optimal_score - population_res(i)));                
    end
    [optimum_diff, indices] = sort(optimum_diff);
    population_res = population(indices);
    best_cells = population_res(1:ceil(length(population_res)*0.25));
    pop_size = numel(population);
    indices =  (randperm(floor(pop_size/2), floor(pop_size*0.25))) + pop_size/2;
    other_cells = population_res(indices);
    
    selected = [best_cells other_cells];
    
end 