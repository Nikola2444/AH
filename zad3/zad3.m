clc
clear

% 20 circuit size za E = 0; selection ration 4:1
%% STARTING PARAMETERS
optimal_score = 3.1415;
mutation_prob = 0.005; % value beetween 0 - 1
generation_size = 50;    
circuit_size = 15; % number of resistors
E_24_or_ohm = 0; % 0 for E_24 resistors 1 for 1ohm resistors

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

for j = 1 : 10
    population = create_population(generation_size, circuit_size, E_24);
    fittest_half = get_fittest_half(population, optimal_score);
    fittest = equivalent_res(fittest_half(1));
    new_population = crossover(fittest_half)
    best = fittest
    i = 0;
    k = 1;
    %while (abs(best - optimal_score) > 0.000005)
    for i = 1 : 1000
         if(abs(fittest - optimal_score) < abs(best - optimal_score))
             best = fittest;
         end
         disp(i)
         disp([fittest best best - optimal_score j])
         
         new_population = crossover(fittest_half);
         new_population = mutation(new_population, mutation_prob, E_24);
         %fittest_half = get_fittest_half(new_population, optimal_score);
         fittest_half = selection(new_population, optimal_score);
         fittest = (equivalent_res(fittest_half(1)));
         i = i + 1;
         if (abs(fittest - optimal_score) < 0.000005)
             best_ppl(k) = fittest;
             k = k + 1;
             break;Nikola
         end
    end
    
end


 

