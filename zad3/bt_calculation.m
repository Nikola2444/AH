%% this functions expetexts next input parameters
% ress_tree: binary tree that represents the circuit
% depth_first: is an array that contains node indexes in
% depth_first manner
% node is the starting node
function [Y,n] = bt_calculation(res_tree, depth_first, node)
    node;
    if (res_tree.isleaf(depth_first(node)) ~= 0)
        Y = (res_tree.get(depth_first(node)));
        n = node;
    elseif (res_tree.get(depth_first(node)) == -1)
       
        [YL, n] = bt_calculation(res_tree, depth_first, node + 1);
        [YR, n] = bt_calculation(res_tree, depth_first, n + 1);
        Y = YL + YR;
    elseif (res_tree.get(depth_first(node)) == 0)
        [YL, n] = bt_calculation(res_tree, depth_first, node + 1);
        [YR, n] = bt_calculation(res_tree, depth_first, n + 1);
        Y = paralel_res(YL,YR);
    else
        error("wrong node values entered");
        Y = 0
        n = 0
    end
    
    
end