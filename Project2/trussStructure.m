%Truss Structure
%Problems 1-4

%Joints in Order
% f = [f1;
%      f2;
%      f3;
%      f4;
%      f5;
%      F1;
%      F2]
aMatrix = [sqrt(2)/2, 0, 1/2, 0, 0, 0, 0;
           sqrt(2)/2, 1, sqrt(3)/2, 0, 0, 0, 0;
           sqrt(2)/2, 0, 0, 1, 0, 0, 0;
           sqrt(2)/2, 0, 0, 0, 0, -1, 0;
           0, 0, 0, 1, 1, 0, 0;
           0, -1, 0, 0, 0, 0, 0;
           0, 0, 1/2, 0, 1, 0, 0;
           0, sqrt(3)/2, 0, 0, 0, 0, -1];
%Solution must be multiplied by 1000
       solutionMatrix = [0;
                  0;
                  0;
                  0;
                  0;
                  -5;
                  0;
                  0];
sizeA = size(aMatrix)
sizesSolution = size(solutionMatrix)
rrefForm = rref(aMatrix)
RANK = rank(rrefForm)
M = [aMatrix, solutionMatrix];
rref([aMatrix, solutionMatrix])

%Solution must be multiplied by 1000
syms a;
       solutionMatrix2 = [0;
                  0;
                  0;
                  0;
                  0;
                  -a;
                  0;
                  0];
              rref([aMatrix, solutionMatrix2])
             reset(symengine)