function population = create_population(number_of_circuits, circuit_size, E_24)
    for i= 1 : number_of_circuits + 1
        circuit = random_circuit(8, E_24);
        circuit_tree = create_binary_tree(circuit);
        %disp(circuit_tree.tostring())
        population(i) = circuit_tree;
    end
end