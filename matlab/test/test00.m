
% L.test()

% s='/data/PROJECTS/CMRCode/python/data/meas_MID00024_FID188178_Multislice.dat';
% n='/data/PROJECTS/CMRCode/python/data/meas_MID00027_FID188181_Multislice_no_RF.dat';


% k=mapVBVD(n);
% K=k.image();
% N=permute(K(:,:,:,1,1),[1,3,2]);
% s=mapVBVD(s,'removeOS','doAverage');
% s=s.image();
% 
% S=permute(s(:,:,:,1,1),[1,3,2]);


load d.mat
% N =N(1:2,1:3,1:4);
% S =S(1:2,1:3,1:4);
L=cm2DReconRSS();
L.setSignalKSpace(S)
L.setNoiseKSpace(N)



display(L.getNoiseBandWidth()); 

imagesc(abs(L.getNoiseCovariance())); 

abs(L.getPrewhitenedSignal()); 

imagesc(L.getOutput())

L=cm2DKellmanRSS()
L.setSignalKSpace(S)
L.setNoiseKSpace(N)
imagesc(L.getOutput())
