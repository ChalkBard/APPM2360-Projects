function [maxV, maxGamma, bkVec] = powerMethod(A)

%%%Initial Values%%%
%initial absolute gamma
absGammaCorrected = 1;
%initial x
bx = rand(33,1);
%initial gamma
gamma = 10;

%%%Calculation of EigenVector and EigenValue%%%
index = 1;
bkVec = zeros(1,33);
while (absGammaCorrected > 0)
    bk1 = A*bx;
    absGammaCorrected = abs(norm(bx)-gamma);
    gamma = norm(bx);
    bx = bk1/gamma;
    bkVec = vertcat(bkVec, transpose(bx));
    index = index + 1;
end
bkVec = bkVec(2:end,1:end);
maxV = bx;
maxGamma = gamma;
end
