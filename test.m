%reference : Near-Field Integrated Sensing and Communications
%data:2023/8/21
%author:jifa zhang
%conclusion: beamforming focusing 


clc,clear;
close all;
N = 65;% antenna number
d = 0.5 / (N-1);% element distance
lambda = 1.07*10^(-2);% waveform length
% r_t = 20;%distance between antenna and target
theta_t = 45;%degree of target

% r = 10:0.2:30; % distance region
theta = 0:1:90;% angle region
n = -(N-1)/2:(N-1)/2;% element index
% P = zeros(length(r),length(theta));% power distribution function


 
% P1 = zeros(size(P));
w1 = exp(-1i*2*pi/lambda*n'*cosd(theta_t));
A = exp(-1i*2*pi/lambda*n'*cosd(theta));
P1_temp = abs(w1'*A);
% P = repmat(P1_temp,length(r),1);

figure
plot(theta,db(P1_temp))
xlabel('angle (degree)')
ylabel('bampattern')