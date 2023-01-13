array=[-2 0 0; -1 0 0; 0 0 0; 1 0 0; 2 0 0];
directions=[30,0; 35,0; 90,0];

%% task1 
Z=pattern1(array);
figure(1)
plot2d3d(Z,0:180,0,'gain in dB','initial pattern');

%% task2 
S=spv(array,directions);
Rmm=eye(3,3); % (A,A) (B,B) (C,C) are 1, others are 0
sigma2=0.0001;
Rxx_theoretical=S*Rmm*S'+sigma2*eye(5,5);

 %% task 3
 load Xaudio.mat;
 load Ximage.mat;
 soundsc(real(X_au(2,:)),11025);
 displayimage(X_im(2,:),image_size,201,'The received signal at 2nd antenna');

 Rxx_au=X_au*X_au'/length(X_au(1,:));
 Rxx_im=X_im*X_im'/length(X_im(1,:));

 %% task 4
 directions=[];
 Rmm=[];
 S=[];
 sigma2=[];

 %% task 5
 val_theo=eig(Rxx_theoretical);
 val_au=eig(Rxx_au); val_im=eig(Rxx_im);

 %% task 6
 Sd=spv(array,[90,0]);
 a=1;
 wopt=a*Rxx_theoretical\Sd;%inv(Rxx_theoretical)*Sd
 Z=pattern1(array, wopt);
 plot2d3d(Z, 0:180,0,'gain in dB','W-H array pattern');
 
 




 