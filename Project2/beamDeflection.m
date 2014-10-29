syms P r q a b C m
%(4)
eqn4 = 'D2y=P*Dy+q*y+r';
inits4 = 'y(a)=b, Dy(a)=0';
eqn4Sol=dsolve(eqn4, inits4, 'x')
%(5)
eqn5 = 'D2y=P*Dy+q*y';
inits5 = 'y(a)=0, Dy(a)=1';
eqn5Sol=dsolve(eqn5, inits5, 'x')

eqn31 = 'D2y=P*Dy+q*y+r';
eqn31inits = 'y(a)=b, Dy(a)=m'
eqn31Sol = dsolve(eqn31, eqn31inits, 'x')
eqn3 = eqn4Sol + C*eqn5Sol;
eqnSol = (eqn31Sol - eqn4Sol)/eqn5Sol