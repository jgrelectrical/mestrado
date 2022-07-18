clear all
close all
clc
Beta = [10; 28; 8/3];
x0 = [0;0.1;0.1]; 
% x0 = [1;0.5;0.9]; 

tspan = 0.01:0.01:42;

options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
% x(1) = x;
% x(2) = y;
% x(3) = z;
% Beta(1) = sigma
% Beta(2) = rho
% Beta(3) = beta
% "f" corresponde as EDOs
f = @(time,x)[Beta(1)*(x(2)-x(1));
    x(1)*(Beta(2)-x(3)) - x(2); 
    x(1)*x(2)- Beta(3)*x(3);];
[time,x] = ode45(f,tspan,x0,options); % Runge-Kutta 4th/5th order ODE solver

% T = awgn(x(:,1),2);

% T =x(801:end,1);

T = x(:,1);

% T =x(1001:end,1);

fileID = fopen('serie.dat','w');
% fprintf(fileID,'source target weight\n');
fprintf(fileID,'%.7f\n',T');
fclose(fileID);

LLE = 0.3935;
Q=20;
n=length(T);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculo das incertezas e dos limites inferiores e superiores
serie_intervalo=incertezas(T,LLE,tspan,n);
sinal_original=serie_intervalo;
serie_original=serie_intervalo;


figure
hold on
plot(serie_intervalo(:,1))
plot(serie_intervalo(:,3))


