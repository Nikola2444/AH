function [fittest index] = get_fittest(population, optimal_score)
    best_result = abs(optimal_score - equivalent_res(population(1)));
    for i = 2:length(population)
        temp = equivalent_res(population(i));
        temp = abs(optimal_score - temp);
        if (best_result > temp)
            equivalent_res(population(i));
            best_result = temp;
            index = i;
        end 
    end
    fittest = equivalent_res(population(index));
end