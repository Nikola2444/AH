circuit = random_circuit(8, E_24);
circuit_tree = create_binary_tree(circuit);
disp(circuit_tree.tostring())
bt_calculation(circuit_tree, circuit_tree.depthfirstiterator, 1)