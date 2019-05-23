%% R kolo zad1 koristeci njihovo resenje
clc
clear
syms I1 I2 r


S = [10 0 0 -4; 0 16 -4 0; 0 -4 10 0; -4 0 0 16]
Y = [(26 + 2*r); (34 + 2*r); (31- 3*r); (38 -2*r)];

S_inv = inv(S);

X = S_inv * Y

I1 = [X(1) X(3)]
I2 = [X(2) X(4)]
x = linspace(3.2, 4.5, 1000);
I1_trimf = trimf(x,[subs(I1(1),r,0) subs(I1(1),r,1) subs(I1(2),r,0) ])
plot(x, I1_trimf, '-r')
title('struja I1')
hold on

I2_trimf = trimf(x,[subs(I2(1),r,0) subs(I2(1),r,1) subs(I2(2),r,0) ])
plot(x, I2_trimf, '-b')
title('Zadatak 1')
%% using fuzzy arith functions (ne radi, nisam uspeo da resim sistem jednacina)
clc
clear
syms r
Ug1 = [(39 +r), (42 -2*r)]
Ug2 = [(11 +r), (13 -r)]
Ug3 = [(23 +r), (25 - r)]
x = linspace(0, 45, 1000);
Ug1_trimf = trimf(x, [subs(Ug1(1), r, 0), subs(Ug1(1), r, 1), subs(Ug1(2), r, 0)]);
Ug2_trimf = trimf(x, [subs(Ug2(1), r, 0), subs(Ug2(1), r, 1), subs(Ug2(2), r, 0)]);
Ug3_trimf = trimf(x, [subs(Ug3(1), r, 0), subs(Ug3(1), r, 1), subs(Ug3(2), r, 0)]);

Ug12_trimf = fuzarith(x,Ug1_trimf,Ug2_trimf,'sub');
%plot(x, Ug12_trimf)
Ug23_trimf = fuzarith(x,Ug2_trimf,Ug3_trimf,'sum');
% ne znam dalje kako







%% RLC kolo zad2 koristeci njihovo resenje

A = [10 -6; -6 16]
B = [-7.5 5; 5 3];

U = [(4 + r) (6 - r); (-2 + r) -r]
V = [(-1 + r) (1 - r); (-3 + r) (-1 - r)]

S1_A = A;
S1_A(A < 0) = 0
 
S1_B = B;
S1_B(B < 0) = 0


S2_A = A;
S2_A (A > 0) = 0

S2_B = B;
S2_B (B > 0) = 0

S1 = [S1_A -S2_B; S1_B S1_A]
S2 = [S2_A -S1_B; S2_B S2_A]

S = [S1 S2; S2 S1]
Y = [(4 + r); (-2 + r); (-1 + r); (-3 + r); (6 - r); (-r); (1 - r); ...
    (-1 - r)]
S_inv = inv(S);
I = vpa(S_inv * Y, 5)

I1_real = vpa([I(1), I(5)], 4)

x = linspace(-0.3, 0.45, 1000);
I1_real_trimf = trimf(x,[subs(I1_real(1), 0), subs(I1_real(1), r, 1) subs(I1_real(2), r, 0)])
figure
plot(x, I1_real_trimf, '--r')
title('I1_real');
I1_imag = vpa([I(3), I(7)], 4)
hold on

I1_imag_trimf = trimf(x,[subs(I1_imag(1), 0), subs(I1_imag(1), r, 1) subs(I1_imag(2), r, 0)])

plot(x, I1_imag_trimf, '-r');
title('I1_imag')
hold on
I2_real = vpa([I(2), I(6)], 4)
I2_params_real = vpa(eval(I2_real), 4)

I2_real_trimf = trimf(x,[subs(I2_real(1), 0), subs(I2_real(1), r, 1) subs(I2_real(2), r, 0)])

plot(x, I2_real_trimf, '--b')
title('I2_real');
hold on

I2_imag = vpa([I(4), I(8)], 4)
I2_params_imag = vpa(eval(I2_imag), 4)


I2_imag_trimf = trimf(x,[subs(I2_imag(1), 0), subs(I2_imag(1), r, 1) subs(I2_imag(2), r, 0)])

plot(x, I2_imag_trimf, '-b')
title('Zadatak 2');
vpa(eval(U),4)
vpa(eval(U),4)