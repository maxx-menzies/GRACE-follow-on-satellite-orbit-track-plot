function [Rho_dot] = GFO_RangeRate(r1,r2,v1,v2)
%GFO_RangeRate takes in the positions and velocities of the two satellites
%and returns the inter-satellite range-rate.
%r1 = [x1 y1 z1], contains the position data for GRACE-FO #1 (C)
%r2 = [x2 y2 z2], contains the position data for GRACE-FO #2 (D)
%v1 = [Vx1 Vy1 Vz1], contains the velocity data for GRACE-FO #1 (C)
%v2 = [Vx2 Vy2 Vz2], contains the velocity data for GRACE-FO #2 (D)

Rho = GFO_Range(r1,r2); %IS THIS SUPPOSED TO BE AN INPUT PARAMETER??

%declare some of the variables in the formula for inter-satellite range 
deltaV = v2 - v1;
deltaR = r2 - r1;
eLOS12 = deltaR ./ Rho;

%Calculate the dot product by elementwise multiplication and then summing
%the values across the rows
Rho_dot = sum(deltaV .* eLOS12,2);

end