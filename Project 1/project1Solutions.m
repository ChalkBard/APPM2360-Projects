%APPM 2360 Project 1
%QUESTIONS
clear
clc
%Question 1
%   Classify model (4). Also, describe each term in the model and discuss the units involved
%WILL BE SOLVED IN PAPER

%Question 2
%   Show that taking the compounding rate to infinity, model (1) converges to model (2).
% syms Ao r n t
% assume(Ao >0)
% assume(r > 0)
% assume (t > 0)
% model1Limit=limit(Ao.*(1+(r./n)).^(n.*t), r , Inf, 'left')
% reset(symengine)

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
        xlabel('Years')
        ylabel('Account Balance')
        title('Annual Intrest rate of 10%')
       legend('Discrete Model', 'Continous Model')
        print -depsc n1r10.eps
        %n = 2
        plot(t, model1(t, 2, r, Ao), t, model2(t, r, Ao))
        xlabel('Years')
        ylabel('Account Balance')
        title('Biannual Intrest Rate of 20%')
       legend('Discrete Model', 'Continous Model')
        print -depsc n2r10.eps
        %n = 4
        
        plot(t, model1(t, 4, r, Ao), t, model2(t, r, Ao))
        xlabel('Years')
        ylabel('Account Balance')
        title('Quarterly Intrest Rate of 10%')
       legend('Discrete Model', 'Continous Model')
       print -depsc n4r10.eps
        %n = 12
        
        plot(t, model1(t, 12, r, Ao), t, model2(t, r, Ao))
        xlabel('Years')
        ylabel('Account Balance')
        title('Monthly Intrest Rate of 10%')
       legend('Discrete Model', 'Continous Model')
        print -depsc n12r10.eps
    %Create 4 curves such that 0<=t<=100 and Ao = 1 and r=20%
    r = .2;
      %n = 1        
        plot(t, model1(t, 1, r, Ao), t, model2(t, r, Ao))
        xlabel('Years')
        ylabel('Account Balance')
        title('Yearly Intrest Rate of 20%')
        legend('Discrete Model', 'Continous Model')
        print -depsc n1r20.eps
        %n = 2        
        plot(t, model1(t, 2, r, Ao), t, model2(t, r, Ao))
        xlabel('Years')
        ylabel('Account Balance')
        title('Biannual Intrest Rate of 20%')
       legend('Discrete Model', 'Continous Model')
        print -depsc n2r20.eps
        %n = 4        
        plot(t, model1(t, 4, r, Ao), t, model2(t, r, Ao))
        xlabel('Years')
        ylabel('Account Balance')
        title('Quarterly Intrest rate of 20%')
        legend('Discrete Model', 'Continous Model')
        print -depsc n4r20.eps
        %n = 12   
        plot(t, model1(t, 12, r, Ao), t, model2(t, r, Ao))
        xlabel('Years')
        ylabel('Account Balance')
        title('Monthly Intrest Rate of 20%')
        legend('Discrete Model', 'Continous Model')
        print -depsc n12r20.eps
        
    %How accurate is model 2 vs. model 1
    %   Determined in Paper

%Question 4
%   Determine if model 2 is reasonable model for 1 when n=365
    %   Plot the Two together
    %   r=10%
    r=.1;
    plot(t, model1(t, 365, r, Ao), t, model2(t, r, Ao))
    xlabel('Years')
    ylabel('Account Balance')
    title('Daily Intrest Rate of 10%')
    legend('Discrete Model', 'Continous Model')
    print -depsc Prob4_r10.eps
    %   r=20%
    r=.2;
    plot(t, model1(t, 365, r, Ao), t, model2(t, r, Ao))
    xlabel('Years')
    ylabel('Account Balance')
    title('Daily Intrest Rate of 20%')
    legend('Discrete Model', 'Continous Model')
    print -depsc Prob4_r20.eps
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
xlabel('Account Balance')
ylabel('Change in Account Balance')
title('Derivative Behavior of Model 4')
print -depsc model4.eps

%Question 7
  %r=10% and P=20 in model 4 so plot the slope field
[T, Y] = meshgrid(0:10:300, 0:50:900);
quiver(T, Y, ones(size(T)), model4(Y, 20, .1))
 hold on
r = .1;
P = 20;
t=0:.1:300;
plot(t, ((P - (P - 200*r)*exp(r*t))/r))
hold on
plot(t, ((P - (P - 250*r)*exp(r*t))/r))
plot(t, ((P - (P - 100*r)*exp(r*t))/r))
plot(t, ((P - (P - 0*r)*exp(r*t))/r))
axis([0, 300, 0, 900])
xlabel('Years')
ylabel('Account Balance')
title('Model 4 Direction Field')
print -depsc model4dirfield.eps
hold off
%Question 8
%   Solve model 4 as an IVP with Ao
model4eqn = 'DA = r*A-P'
soln4 = dsolve(model4eqn)
t=0;
 syms Ao r A P C2
    model4SolvedAo = solve(((P - C2*exp(r*t))/r)-Ao, C2)
    reset(symengine)

%Question 9
%   Using the result from 8 solve for time t

    %Solve for t
    syms Ao r t A P C2
    model4SolvedT = solve(((P - (P - Ao*r)*exp(r*t))/r)-A, t)
    reset(symengine)
    
    %Plot t as a function of Pr
    Ao = 1;
    r = .1;
    A = 2;
    P = 0:1:10;
    t = log((P - A.*r)./(P - Ao.*r))./r;
    plot(P, t)
    xlabel('Payment to Account')
    ylabel('Years')
    title('Years to Reach Account Balance for a given Payment')
    print -depsc model4timeVp
%     
 %Question 11
 %plot P as a function of t
 syms Ao r t A P
 model4SolvedP = solve(((P - (P - Ao*r)*exp(r*t))/r)-A, P)
 reset(symengine)
%  
 Ao = 1;
    r = 1;
    A = 5;
    t = 0:1:10;
    P = -(r.*(A - Ao.*exp(r*t)))./(exp(r.*t) - 1);
    plot(t, P)
    xlabel('Years')
    ylabel('Payent')
    title('Payment Required to Reach Desired Balance in Time')
    print -depsc model4pVtime
    
    model5eqn = 'DA = r*A+P'
soln5 = dsolve(model5eqn)
t=0;
 syms Ao r A P C2
    model5SolvedAo = solve((-(P - C2*exp(r*t))/r)-Ao, C2)
    reset(symengine)