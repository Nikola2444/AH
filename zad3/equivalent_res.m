function res = equivalent_res(circuit)
    res = bt_calculation(circuit, circuit.depthfirstiterator, 1);
end 