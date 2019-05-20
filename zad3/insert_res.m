function [Y, i] = insert_res(circuit, resistors, node, i)
    Y = circuit;
    if (length(Y.getchildren(node)) == 2)
        children = Y.getchildren(node);
        [Y, i] = insert_res(Y, resistors, children(1), i);
        [Y, i] = insert_res(Y, resistors, children(2), i);      
    elseif (length(circuit.getchildren(node)) == 1)
        children = Y.getchildren(node);
        [Y, i] = insert_res(Y, resistors, children(1), i);
        Y = Y.addnode(node, resistors(i));
        i = i + 1;
        node;
    else 
        Y = Y.addnode(node, resistors(i));
        Y = Y.addnode(node, resistors(i + 1));
        i = i + 2;
        node;
    end
end