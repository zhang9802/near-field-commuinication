%reference : Near-Field Integrated Sensing and Communications
%data:2023/8/21
%author:jifa zhang
%conclusion: beamforming focusing 


clc,clear;
close all;
N = 405;% antenna number
D = 0.5;% antenna aperture
d = D / (N-1);% element distance
lambda = 3*10^(-3);% waveform length
r_t = 2;%distance between antenna and target
theta_t = 45;%degree of target

r = 1:0.05:5; % distance region
theta = 0:0.5:90;% angle region
n = -(N-1)/2:(N-1)/2;% element index
P = zeros(length(r),length(theta));% power distribution function
rn = sqrt(r_t^2+(n.^2*d^2)-2.*r_t.*n.*d*cosd(theta_t));
w = exp(-1i*2*pi/lambda*(rn-r_t)).';% predefined beamforming vector
[R,Theta] = meshgrid(r,theta); % x and y -axis grids

% calculate the power distribution
for ii=1:length(r)
    
    for kk=1:length(theta)

        rn = sqrt(r(ii)^2+(n.^2*d^2)-2.*r(ii).*n.*d*cosd(theta(kk)));
        steering = exp(-1i*2*pi/lambda*(rn-r(ii))).';
        P(ii,kk) = abs(w'*steering);
    
    
    end
end
% figure
% mesh(P)

% plot
figure
surf(R,Theta,P')
xlabel('distance (m)')
ylabel('angle (degree)')
title('beampattern')
colormap default
shading flat     % 各小曲面之间不要网格
colorbar

%% far field
% P1 = zeros(size(P));
w1 = exp(1i*2*pi/lambda*n'*cosd(theta_t));
A = exp(1i*2*pi/lambda*n'*cosd(theta));
P1_temp = abs(w1'*A);
P1 = repmat(P1_temp,length(r),1);
figure
surf(R,Theta,P1')
xlabel('distance (m)')
ylabel('angle (degree)')
title('beampattern')
colormap default
shading flat     % 各小曲面之间不要网格
colorbar
figure
plot(theta,P1_temp)
