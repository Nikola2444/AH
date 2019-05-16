clc
clear


%% generate E24 resistor values
E24_base = [1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.8 2.0 2.2 2.4 2.7 3.0 3.3 3.6 3.9 4.3 4.7 5.1 5.6 6.2 6.8 7.5 8.2 9.1];
for i = 1 : 25
    for j = 1 : 7
        E_24(i,j) = E24_base(i) * 10^(j - 1)
    end
end

%% Create population
population = create_population(50, 8, E_24)



