function m_population = mutation(population, chance, E_24, optimal_score, precision)
      m_population = population;
    for i = 1:length(population)
        difference_optimal = abs(equivalent_res(population(i)) - optimal_score);
        if (rand()< chance && difference_optimal > precision)            
            [resistors, operations] = circuit_from_tree(population(i));
            
            %mutation = E_24(randi(numel(E_24), 1));         
            m_population(i) = create_binary_tree(insert_rand_element(resistors, operations, E_24));
            m_population(i);
            %disp(m_population(i).tostring);
        else
            m_population(i) = population(i);
        end
end