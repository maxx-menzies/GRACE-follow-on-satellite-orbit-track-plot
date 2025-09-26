function [Rho] = GFO_Range(r1,r2)
%GFO_Range takes in two matricies of the position of the satellites and
%returns the inter-satellite range between them.
%r1 = [x1 y1 z1], contains the position data for GRACE-FO #1 (C)
%r2 = [x2 y2 z2], contains the position data for GRACE-FO #2 (D)

%Formula for inter-satellite distance:
%Rho = sqrt(x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2

%make deltaR so simplify the equation
deltaR = r2 - r1;

%Formula
Rho = sqrt(sum(deltaR.^2,2));

end