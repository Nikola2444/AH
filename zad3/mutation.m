function m_population = mutation(population, chance, E_24)
    m_population = population;
    for i = 1:length(population)
        if (rand()< chance)
            [resistors, operations] = circuit_from_tree(population(i));
            
            %mutation = E_24(randi(numel(E_24), 1));         
            m_population(i) = create_binary_tree(insert_rand_element(resistors, operations, E_24));
            %disp(m_population(i).tostring);
        else
            m_population(i) = population(i);
        end
    end
    
    
end 