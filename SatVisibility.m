function [el,index_vis] = SatVisibility(rG,r1)
%The function SatVisibility finds the distances from SLR to GRACE-FO #1 and
%the times at which that angle exceeds 10 degrees
%rG = [xG yG zG], the ECEF position of the SLR (row vector 1x3)
%rG = [1130714.219, -4831369.903, 3994085.962];
%r1 = [x1 y1 z1], contains the position data for GRACE-FO #1 (C)
%el = column vector indicating the elevation angle of GRACE-FO #1 from rG
%index_vis = the index of elecation angles greater than 10 degrees in the
%column vector el, this indicates the "epochs" of GRACE-FO #1 where it is
%visible from rG

%declare some variables to make the formula easier
deltaR = r1 - rG;
deltaZ = r1(:,3) - rG(3);
d = sqrt(sum(deltaR.^2,2));

%Simplified Formula
el = asind(deltaZ ./ d);

index_vis = find(el > 10);

end