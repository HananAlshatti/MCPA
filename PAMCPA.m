% Hanan Alshatti - 101137569 %
% PA session 3 % 

set(0,'DefaultFigureWindowStyle', 'docked')
set(0,'defaultaxesfontsize', 20)
set(0, 'defaultaxesfontname', 'ComicSans')
set(0,'DefaultLineLineWidth', 2);

close all
clear all 
clc

v = 0; 
x = 0; 
 
F = 1 ;
m  = 1 ;
dT = 1 ; 

nsteps = 250; 
np  = 1;
% intialize
v = zeros (np,1); % velocity vector
x = zeros (np,1); % postion vector
t = 0; % time

%re = 0;
for i = 2: nsteps
    t(i) = t(i-1)+dT;
    
    v(:,i) = v(:,i-1) + F/m*dT;
    x(:,i) = x(:,i-1) + v(:,i-1)*dT + F/m*dT^2/2;
    
    randVal = rand(np,1) < 0.05;
    % v(randVal,i) = re * v(randVal,i);
    v(randVal,i) = 0; %restart the velocity 
    Avgv (i,:) = mean (v,2);
    
    subplot (2,1,1)
    plot (t, v, 'r-','color', 'g');
    hold on
    subplot (2,1,1)
    plot (t, Avgv, 'b*');
    hold off 
    xlabel('t')
    ylabel ('x')
   title(sprintf('velocity drift = %0.5f',Avgv(i)))
   
    
    subplot(2,1,2);
    hold on;
    plot(t,x,'r');
    title(['x value:' num2str(x(i))])
    hold off;
    
    pause(0.01)
end 