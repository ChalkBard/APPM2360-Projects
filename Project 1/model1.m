function [ A ] = model1( t, n, r, Ao )

A = Ao.*(1+(r./n)).^(n.*t);

end

