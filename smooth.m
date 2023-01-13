%% smooth fuction
% Rmm=[1,1,0;1,1,0;0,0,1]; %sources from 30 and 35 degrees fully correlated
% array=[-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
% directions=[30,0; 35,0; 90,0];
% S=spv(array,directions); S= modified covriance matrix %S= E(s(t)s(t)#) ==>Rxx
% p= 4;%p=overlapping part subarray p= 4

function Rbar=smooth(array,Rmm,S)
L=length(array);% L=sensors number
q=3; m=4; %m=size of subarray ; q=3; m>=q+1=4
M=L-m+1; %number of subarrays=2
D=diag(S(1:q,1));
Rbar=zeros();
for k=1:M
    Rbar=Rbar+(1/M)*(D.^(k-1))*Rmm*((inv(D'*D)*D').^(k-1));
end

% Rxx_smooth=S*Rbar*S'+sigma2*eye(5,5);
% [Psmooth,Pcoh]=music(array, Rxx_smooth,3);
% plot2d3d(Psmooth,0:180,0,'gain in dB','smooth MuSIC pattern');