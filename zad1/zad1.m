clear
clc
%% ZAD1  dvo-ulazni multiplekser
% training data
x1_training_data = [0 0 0 0 1 1 1 1 1 0 1 0 1 1 0]; 
x2_training_data = [0 0 1 1 0 0 1 1 0 0 1 0 0 0 1];
sel =              [0 1 0 1 0 1 0 1 1 0 1 1 0 1 1];
y=                 [0 0 0 1 1 0 1 1 0 0 1 0 1 0 1];

x_training_data = [x1_training_data;x2_training_data;sel];

% Testing data
x1_test = [0, 0, 1, 1 1 1]
x2_test = [0, 1, 1, 1 0 0]
sel_test = [0, 1, 0 ,1 0 1]

x_test = [x1_test;x2_test;sel_test];    


[Y,Xf,Af] = mux2_1_nn(x_test) % funkcija dobijena od strane nnstart alata

%~a ~c ~d + b ~c ~d + a ~b ~c + ~a b ~c d + ~a ~b c ~d
%~x[1] *~x[3]* ~x[4] + x[2] * ~x[3] *~x[4] + x[1] * ~x[2] *~x[3] + ~x[1]* x[2] *~x[3] * x[4] + ~x[1] * ~x[2] *x[3]*~x[4]
%~a ~b ~d + ~c ~d + ~a b ~c + a ~b ~c

%% ZAD1  cetvoro-ulazni multiplekser

% kreiranje podataka za treniranje neuralne mreze
x1_training_data(1) = 0;
x2_training_data(1) = 0;
x3_training_data(1) = 0;
x4_training_data(1) = 0;
sel1(1) = 0;
sel2(1) = 0;
for i = 1:150
    x1_training_data(i+1) = mod(i, 2);
    if (mod(i, 2) == 0)
        x2_training_data(i+1) = xor(x2_training_data(i), 1);
    else
        x2_training_data(i+1) = x2_training_data(i);
    end
    if (mod(i, 4) == 0)
        x3_training_data(i+1) = xor(x3_training_data(i), 1);
    else
        x3_training_data(i+1) = x3_training_data(i);
    end
    
    if (mod(i, 8) == 0  && i ~= 0)
        x4_training_data(i+1) = xor(x4_training_data(i), 1);
    else
        x4_training_data(i+1) = x4_training_data(i);
    end
    
    if (mod(i, 16) == 0  && i ~= 0)
        sel1(i+1) = xor(sel1(i), 1);
    else
        sel1(i+1) = sel1(i);
    end
    
    if (mod(i, 32) == 0  && i ~= 0)
        sel2(i+1) = xor(sel2(i), 1);
    else
        sel2(i+1) = sel2(i);
    end
    
    
    
end

for i = 1 : 151
    if (sel1(i) == 0 && sel2(i) == 0)
        y(i) = x1_training_data(i);
    elseif (sel1(i) == 1 && sel2(i) == 0)
        y(i) = x2_training_data(i);
    elseif (sel1(i) == 0 && sel2(i) == 1)
          y(i) = x3_training_data(i);
    else 
          y(i) = x4_training_data(i);
    end
end

x = [x1_training_data;x2_training_data;x3_training_data;x4_training_data;sel1;sel2];

% podaci korisceni za testiranje
x1_test = [0, 0, 1, 1 1 1]
x2_test = [0, 1, 1, 1 0 0]
x3_test = [1, 0, 0, 1 0 1]
x4_test = [1, 1, 1, 1 0 1]
sel1_test = [1, 0, 0 ,1 0 1]
sel2_test = [0, 1, 0 ,1 0 1]
x_test = [x1_test;x2_test;x3_test;x4_test;sel1_test;sel2_test]; 

[Y,Xf,Af] = mux4_1_nn(x_test) % funkcija dobijena od strane nnstart alata





