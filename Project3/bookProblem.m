%Question 4
                %1, 2, 3, 4, 5, 6,
bookAdjacency = [0, 0, 0, 0, 1, 0;%1
                 0, 0, 0, 0, 1, 1;%2
                 0, 1, 0, 0, 0, 1;%3
                 1, 0, 1, 0, 1, 0;%4
                 1, 1, 0, 1, 0, 0;%5
                 1, 1, 1, 0, 0, 0]%6
[v,e]=eigs(bookAdjacency, 1)

%Create student matrix
load('student_adjacency.txt')
studentMatrix = zeros(33, 33);
addedZeros = zeros(30,1);
addedZeros2 = zeros(1, 33);
student_adjacency = horzcat(student_adjacency, addedZeros);
student_adjacency = horzcat(student_adjacency, addedZeros);
student_adjacency = horzcat(student_adjacency, addedZeros);
student_adjacency = vertcat(student_adjacency, addedZeros2);
student_adjacency = vertcat(student_adjacency, addedZeros2);
student_adjacency = vertcat(student_adjacency, addedZeros2);
studentMatrix = student_adjacency + studentMatrix;

%add connections
%mary
studentMatrx(1,31)= 1;
studentMatrix(31,1) = 1;
studentMatrix(2,31) = 1;
studentMatrix(31,2) = 1;
studentMatrix(2,31) = 1;
studentMatrix(31,3) = 1;
studentMatrix(3,31) = 1;
studentMatrix(31,4) = 1;
studentMatrix(4,31) = 1;
studentMatrix(31,5) = 1;
studentMatrix(5,31) = 1;
studentMatrix(31,6) = 1;
studentMatrix(6,31) = 1;
studentMatrix(31,7) = 1;
studentMatrix(7,31) = 1;
studentMatrix(31,8) = 1;
studentMatrix(8,31) = 1;
studentMatrix(31,9) = 1;
studentMatrix(9,31) = 1;

%Fred
studentMatrix(32,10) = 1;
studentMatrix(10,32) = 1;
studentMatrix(32,11) = 1;
studentMatrix(11,32) = 1;
studentMatrix(32,12) = 1;
studentMatrix(12,32) = 1;
studentMatrix(32,13) = 1;
studentMatrix(13,32) = 1;
studentMatrix(32,14) = 1;
studentMatrix(14,32) = 1;

%Veronica
studentMatrix(33,15) = 1;
studentMatrix(15,33) = 1;
studentMatrix(33,16) = 1;
studentMatrix(16,33) = 1;
studentMatrix(33,17) = 1;
studentMatrix(17,33) = 1;
studentMatrix(33,18) = 1;
studentMatrix(18,33) = 1;
studentMatrix(33,19) = 1;
studentMatrix(19,33) = 1;

%Use Power Method
[domV, domGamma, bkVec] = powerMethod(studentMatrix);
%Find error at iteration k
[row, col] = size(bkVec);
for k = 1:1:row;
    ekVec(k,1) = k;
    ekVec(k,2) = norm(transpose(bkVec(k,:))-domV);
end

rateConv = ekVec(51,2)/ekVec(50,2)
for i = 1:1:row;
    rval(i, 1) = (log(rateConv)/log(10))*i;
end
[hAx,hLine1,hLine2] = plotyy(ekVec(:,1),ekVec(:,2),ekVec(:,1),rval,'semilogy','plot');
xlabel('Iteration')
ylabel(hAx(1),'Error From True EigenVector')
ylabel(hAx(2),'R-Value')
title('Error vs. Iteration');
for(i=1:1:33)
    vert(i,1) = i;
end
sortedRows = horzcat(domV, vert);
sortedPeople = sortrows(sortedRows, 1)