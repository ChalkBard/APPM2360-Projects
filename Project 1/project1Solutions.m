%APPM 2360 Project 1
%QUESTIONS
clear
clc
%Question 1
%   Classify model (4). Also, describe each term in the model and discuss the units involved
%WILL BE SOLVED IN PAPER

%Question 2
%   Show that taking the compounding rate to infinity, model (1) converges to model (2).
syms Ao r n t
assume(Ao >0)
assume(r > 0)
assume (t > 0)
model1Limit=limit(Ao.*(1+(r./n)).^(n.*t), r , Inf, 'left')
reset(symengine)

%Question 3
%   Steps below:

    %Solve model 1 & 2 for time
    syms Ao r n t A
    model1US = Ao*(1+(r/n))^(n*t)- A;
    model1Solved = solve(model1US, t)
    
    reset(symengine)
    
    syms Ao r t A
    model2US = Ao*exp(r*t) - A;
    model2Solved = solve(model2US, t)
    
    reset(symengine)
    
    %Create 4 curves such that 0<=t<=100 and Ao = 1 and r=10%
    t = 0:.1:100;
    Ao = 1;
    r = .1;
        %n = 1
        plot(t, model1(t, 1, r, Ao), t, model2(t, r, Ao))
        xlabel('t-value')
        ylabel('Ac/Ad-Value')
        title('n: 1 and r: 10%')
        legend('Continous Model', 'Discrete Model')
        saveas(figure, 'n1r10', 'eps')
        %n = 2
        plot(t, model1(t, 2, r, Ao), t, model2(t, r, Ao))
        xlabel('t-value')
        ylabel('Ac-Value')
        title('n: 2 and r: 10%')
        legend('Continous Model', 'Discrete Model')
        saveas(figure, 'n2r10', 'eps')
        %n = 4
        
        plot(t, model1(t, 4, r, Ao), t, model2(t, r, Ao))
        xlabel('t-value')
        ylabel('Ac-Value')
        title('n: 4 and r: 10%')
        legend('Continous Model', 'Discrete Model')
        saveas(figure, 'n4r10', 'eps')
        %n = 12
        
        plot(t, model1(t, 12, r, Ao), t, model2(t, r, Ao))
        xlabel('t-value')
        ylabel('Ac-Value')
        title('n: 12 and r: 10%')
        legend('Continous Model', 'Discrete Model')
        saveas(figure, 'n12r10', 'eps')
    %Create 4 curves such that 0<=t<=100 and Ao = 1 and r=20%
    r = .2;
      %n = 1        
        plot(t, model1(t, 1, r, Ao), t, model2(t, r, Ao))
        xlabel('t-value')
        ylabel('Ad-Value')
        title('n: 1 and r: 20%')
        legend('Continous Model', 'Discrete Model')
        saveas(figure, 'n1r20', 'eps')
        %n = 2        
        plot(t, model1(t, 2, r, Ao), t, model2(t, r, Ao))
        xlabel('t-value')
        ylabel('Ad-Value')
        title('n: 2 and r: 20%')
        legend('Continous Model', 'Discrete Model')
        saveas(figure, 'n2r20', 'eps')
        %n = 4        
        plot(t, model1(t, 4, r, Ao), t, model2(t, r, Ao))
        xlabel('t-value')
        ylabel('Ad-Value')
        title('n: 4 and r: 20%')
        legend('Continous Model', 'Discrete Model')
        saveas(figure, 'n4r20', 'eps')
        %n = 12   
        plot(t, model1(t, 12, r, Ao), t, model2(t, r, Ao))
        xlabel('t-value')
        ylabel('Ad-Value')
        title('n: 12 and r: 20%')
        legend('Continous Model', 'Discrete Model')
        saveas(figure, 'n12r20', 'eps')
        
    %How accurate is model 2 vs. model 1
    %   Determined in Paper

%Question 4
%   Determine if model 2 is reasonable model for 1 when n=365
    %   Plot the Two together
    %   r=10%
    r=.1;
    plot(t, model1(t, 365, r, Ao), t, model2(t, r, Ao))
    xlabel('t-value')
    ylabel('Ad-Value')
    title('n: 365 and r: 10%')
    legend('Continous Model', 'Discrete Model')
    saveas(figure, 'Prob4_r10', 'eps')
    %   r=20%
    r=.2;
    plot(t, model1(t, 365, r, Ao), t, model2(t, r, Ao))
    xlabel('t-value')
    ylabel('Ad-Value')
    title('n: 365 and r: 20%')
    legend('Continous Model', 'Discrete Model')
    saveas(figure, 'Prob4_r20', 'eps')
    %In what year will the difference between the models be greater that
    %$1? Ao=1 try r= {6.9%, 12.99%, 19.99%}
    %6.9
    Ao = 1;
    r = .069;
    t = 0:1:10000000;
    model1values = model1(t, 365, r, Ao);
    model2values = model2(t, r, Ao);
    for val = 1:1:length(t)
        if abs(model1values(1, val) - model2values(1, val)) > 1
            year69 = val
            break
        end
    end
    %12.99
    Ao = 1;
    r = .1299;
    t = 0:1:10000000;
    model1values = model1(t, 365, r, Ao);
    model2values = model2(t, r, Ao);
    for val = 1:1:length(t)
        if abs(model1values(1, val) - model2values(1, val)) > 1
            year1299 = val
            break
        end
    end
    %19.99
    Ao = 1;
    r = .1999;
    t = 0:1:10000000;
    model1values = model1(t, 365, r, Ao);
    model2values = model2(t, r, Ao);
    for val = 1:1:length(t)
        if abs(model1values(1, val) - model2values(1, val)) > 1
            year1999 = val
            break 
        end
    end
    
    
%Question 5
%Find an equilibrium solution for model 4. What is its signifigance/what
%does it represent?


%Question 6
%   r=10% and P=20 in model 4 and plot from 0 to 300
r = .1;
P = 20;
Ac = 0:.5:300;
plot(Ac, model4(Ac, P, r))
xlabel('Ac-value')
ylabel('dAc/dt-Value')
title('Model 4')
saveas(figure, 'model4', 'eps')

%Question 7
%   r=10% and P=20 in model 4 so plot the slope field
[T, Y] = meshgrid(-5:.1:5, -25:1:25);
quiver(T, Y, ones(size(T)), model4(Y, 20, .1))
hold on
r = .1;
P = 20;
Ac = -25:1:25;
plot(Ac, model4(Ac, P, r))
xlabel('t-value')
ylabel('Ac-Value')
title('Model 4 Direction Field')
saveas(figure, 'model4dirfield', 'eps')

%Question 8
%   Solve model 4 as an IVP with Ao
model4eqn = 'DA = r*A-P'
soln4 = dsolve(model4eqn)

%Question 9
%   Using the result from 8 solve for time t

    %Solve for t
    syms Ao r t A P
    model4SolvedT = solve(soln4-A, t)
    reset(symengine)
    %Plot t as a function of Pr
    Ac = 1;
    r = .1;
    A = 2;
    P = -20:1:20;
    t = log((P-A*r)/Ac)/r;
    plot(P, t)
    xlabel('P-value')
    ylabel('t-Value')
    title('Model 4 Time vs. P-Value')
    saveas(figure, 'model4timeVp', 'eps')
    
 %Question 11
 %plot P as a function of t
 syms Ao r t A P
 model4SolvedP = solve((log((P-A*r)/Ao)/r)-t, P)
 reset(symengine)
%  
 Ao = 1;
    r = 1;
    A = 2;
    t = 0:1:10;
    P = A*r + Ao*exp(r*t);
    plot(t, P)
    xlabel('t-value')
    ylabel('P-Value')
    title('Model 4 P-Value vs. time')
    saveas(figure, 'model4pVtime', 'eps')
    
