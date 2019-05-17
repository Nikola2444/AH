clc
clear
%% STARTING PARAMETERS
optimal_score = 3.1415;
mutation_prob = 10;
generation_size = 50;    
circuit_size = 10; % number of resistors
E_24_or_ohm = 1;

%% generate E24 resistor values
if(E_24_or_ohm == 0)
    E24_base = [1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.8 2.0 2.2 2.4 2.7 3.0 3.3 3.6 3.9 4.3 4.7 5.1 5.6 6.2 6.8 7.5 8.2 9.1];
    for i = 1 : 25
        for j = 1 : 7
            E_24(i,j) = E24_base(i) * 10^(j - 1);
        end
    end
else
    E_24 = ones(25, 7)
end
%% Create population
population = create_population(generation_size, circuit_size, E_24);
%% Evolving 
%[fittest index] = get_fittest(population, optimal_score)
fittest_half = get_fittest_half(population, optimal_score);
fittest = equivalent_res(fittest_half(1));
new_population = crossover(fittest_half)
i = 0;
while (abs(fittest - optimal_score) > 0.00005)
     abs(fittest - optimal_score)
     disp( i)
     disp(fittest)
     new_population = crossover(fittest_half);
     fittest_half = get_fittest_half(new_population, optimal_score);
     fittest = (equivalent_res(fittest_half(1)));
     i = i + 1;
end


 

