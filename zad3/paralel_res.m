function [R] = paralel_res(R1, R2)
    R = R1*R2/(R1+R2);
end