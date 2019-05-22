function new_population = crossover(population)
    new_population = population;
    %population =  population(randperm(length(population)));
    
    iterations = length(population);
    if(mod(iterations,2) ~= 0)
        iterations = iterations - 1;
    end
    
        
    for i = 1:2:iterations
       i;
       [resistors1, operations1] = circuit_from_tree(population(i));
       [resistors2, operations2] = circuit_from_tree(population(i + 1));
       %setdiff(resistors1, resistors2)
       % prvo dete otpornici i operacije 
       msize1 = numel(resistors1);
       msize2 = numel(resistors2);
       operation1_size = numel(operations1);
       operation2_size = numel(operations2);
       if (msize1 > msize2)
           op1 =  (randperm(operation1_size, floor(operation1_size/2)));
           op2 =  (randperm(operation2_size, ceil(operation2_size/2)));
           res1 = (randperm(msize1, ceil(msize1/2))); % sredi indekse
           res2 = (randperm(msize2, floor(length(resistors2)/2)));% sredi indekse
       
       else
           op1 =  (randperm(operation1_size, ceil(operation1_size/2)));
           op2 =  (randperm(operation2_size, floor(operation2_size/2)));
           res1 = (randperm(msize1, floor(msize1/2))); % sredi indekse
           res2 = (randperm(msize2, ceil(length(resistors2)/2)));% sredi indekse
       
       end
       
       first_child1_res = resistors1 (res1);
       first_child2_res = resistors2 (res2);
       first_child_res = [first_child1_res first_child2_res];
       
       first_child1_op = operations1 (op1);
       first_child2_op = operations2 (op2);
       first_child_op = [first_child1_op first_child2_op];
       resistors1(res1) = 0;
       resistors2(res2) = 0;
       %drugo dete otpornici i operacije
       
       second_child_res = [resistors1(resistors1~= 0), resistors2(resistors2 ~= 0)];
       operations1(op1) = 2;
       operations2(op2) = 2;
       second_child_op = [operations1(operations1~=2), operations2(operations2 ~= 2)];
       %setdiff(first_child_res, second_child_res)       
       new_population(i) = create_binary_tree([first_child_op, first_child_res]);
       new_population(i + 1)= create_binary_tree([second_child_op, second_child_res]);
       %disp(new_population(i).tostring);
       equivalent_res(new_population(i));
       %disp(new_population(i + 1).tostring);
       child = equivalent_res(new_population(i + 1));       
       if (child > 3.13 && child < 3.15)
           child
       end
    end
    new_population = [new_population, population];
    
end