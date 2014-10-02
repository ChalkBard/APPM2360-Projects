function [t] = model9( Ac, p, r, Ao)
%module 9
t = (log((Ac-p./r)./(Ao-p./r)))./r
end