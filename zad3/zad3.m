clc
clear

% 20 circuit size za E = 0; selection ration 0.5:0.5
%% STARTING PARAMETERS
optimal_score = 3.1415926535; %broj decimala 
%optimal_score = 3.14159265; 
%ratio 0.3:0.2
mutation_prob = 0.2; % value beetween 0 - 1
generation_size = 60;    
circuit_size = 15; % starting number of resistors in a circuits
E_24_or_ohm = 1; % 0 for E_24 resistors; 1 for 1ohm resistors

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
best_res = 0;
j = 0;
while (abs(best_res - optimal_score) > 0.0000000001)
    population = create_population(generation_size, circuit_size, E_24);
    
    fittest_half = get_fittest_half(population, optimal_score);
    fittest = equivalent_res(fittest_half(1));
    new_population = cross_over3(fittest_half);
    
    i = 0;
    k = 1;
 
    for i = 1 : 400
         if(abs(fittest - optimal_score) < abs(best_res - optimal_score))
             best = fittest_half(1);
             best_res = fittest;
             disp([(best_res) i])
         end
         disp([(best_res) fittest i])
         
         new_population = cross_over3(fittest_half);%cross over
         new_population = mutation(new_population, mutation_prob, E_24, optimal_score);%mutation
       
         fittest_half = selection(new_population, optimal_score);%selection
         fittest = (equivalent_res(fittest_half(1)));%best resistance
         i = i + 1;         
         
         if (new_population(1).nnodes > 150)
             break;
         end
    end
        j = j + 1;      
end
disp(j)

    
  %% Monte Carlo Analysys
  
  
  
  for j = 1 : 1000
      best_ppl_mk = best;
      for i = 1:best_ppl_mk.nnodes;
          node_value = best_ppl_mk.get(i);
          if ( node_value > 0)
              best_ppl_mk = best_ppl_mk.set(i, node_value*(1 + 0.02*(rand()-0.5)));
          end
      end
      resistances_mk(j) = equivalent_res(best_ppl_mk);
  end
  n = 1:1:1000;
  plot(n, resistances_mk);
  disp(['after negative worst case ' equivalent_res(best_ppl_mk)]);
  
  
  