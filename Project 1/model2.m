function [ A ] = model2( t, r, Ao )

A = Ao.*exp(r.*t);

end