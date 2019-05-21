function m_population = mutation(population, chance, E_24)
     
    m_population = population;
    for i = 1:length(population)
        if (rand()< chance)
            %[resistors, operations] = circuit_from_tree(population(i));
            
            %mutation = E_24(randi(numel(E_24), 1));         
            %new_cir = insert_rand_element(operations, resistors,  E_24)
            %for j = 1 : length(new_cir)
             %   m_population(i) = m_population(i).set(j, new_cir(j));
            %end
            %disp(m_population(i).tostring)
            m_population(i) = change_rand_op(m_population(i));
            
            %disp(m_population(i).tostring);
        else
            m_population(i) = population(i);
        end
    end
    
    
end 