%% adding nodes to the tree
clc
clear
P = 0;
S = -1;
R = 1;
circuit = random_circuit(10, E_24);
niz_res = circuit(circuit > 0);
niz = circuit(circuit <= 0);
[res_tree index(1)] = tree(niz(1));


j = 1;
k = 2;
for i = 2 : length(niz)
    if (mod(k,2) == 0)
        j = j + 1
    end 
    [res_tree index(k)] = res_tree.addnode(index(j - 1), niz(k));
    k = k + 1;
end
disp(res_tree.tostring)
for i = 1: length(niz_res) 
    if (mod(k,2) == 0)
        j = j + 1
    end 
    [res_tree index(k)] = res_tree.addnode(index(j - 1), niz_res(k - length(niz)));
    k = k + 1;
end
disp(res_tree.tostring)
%% calculating the resistance of the tree
depth_first_s = res_tree.depthfirstiterator;

bt_calculation(res_tree,depth_first_s, 1)

resistor_op = random_circuit(8, E_24);
[res_tree index(1)] = tree(resistor_op(1));
niz_res = length(resistor_op(resistor_op > 0))
t = tree(resistor_op(1));
j = 1;
k = 1;
for i = 2:ceil((log2(niz_res))) + 1  
    leaves = t.findleaves()
    while (j <= length(leaves))
        k = k + 1;
        t = t.addnode(leaves(j), resistor_op(k));
        k = k + 1;
        t = t.addnode(leaves(j), resistor_op(k));
        j = j + 1;
    end
    
    j = 1;
    
end
td = create_binary_tree(resistor_op)
disp(td.tostring)

