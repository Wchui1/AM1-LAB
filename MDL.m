function M = MDL(Rxx,L)
[E,D]=eig(Rxx); %E:eigenvectors, D: eigenvalues
 %sort eigenvectors according to diagram of eigencalues from large to small 
[d,idx]=sort(diag(D),'descend');
% Ds=D(idx,idx);
E=E(:,idx);
[N,N1]=size(Rxx);
MDL = zeros(N,1);
multi_ln = zeros(N,1);
sumd_ln = zeros(N,1);
list1 = sort(1:N, 'descend');
list2 = 0:(N-1);
list3 = sort((N+1):(2*N), 'descend');
for i = 1:N
    multi = 1; sumd = 0;
    for l = i:N
    multi = multi * d(l);
    sumd = sumd + d(l);
    end
    multi_ln(i,1) = log(multi);
    sumd_ln(i,1) = log(sumd);
end
MDL = -L*(multi_ln+list1'.*(log(list1')-sumd_ln)) + 1/2*list2'.*list3'*log(L);
[~, index] = min(MDL);
M = index - 1;