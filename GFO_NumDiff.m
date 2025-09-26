function [Rho_dot_diff,Rho_dot_ND] = GFO_NumDiff(dt,Rho,Rho_dot)
%GFO_NumDiff inputs the sampling rate, Rho, and Rho_dot, and returns both
%the inter-satellite range-rate computed from inter-satellite range using a
%different method, and the difference between the two methods of range-rate
%dt = the sampling rate (in seconds) of position and velocity vectors given
%in the GRACE-FO files

%initialize N and Rho_dot_ND (since we will be filling in values with a
%loop
N = length(Rho);
Rho_dot_ND = zeros(N,1);

%Find the first value for Rho_dot_ND
Rho_dot_ND(1) = (Rho(2) - Rho(1)) / dt;
%Find the values for Rho_dot_ND from 2 to N-1
for i = 2:N-1
    Rho_dot_ND(i) = (Rho(i+1)-Rho(i-1) / (2*dt) );
end
%Find the last value for Rho_dot_ND
Rho_dot_ND(N) = (Rho(N) - Rho(N-1)) / dt;

Rho_dot_diff = Rho_dot_ND - Rho_dot;

end