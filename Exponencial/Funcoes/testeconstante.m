%teste do codigo
clear all
close all
clc

T = importdata('serie.dat');
tspan = 10.01:0.01:18;
errp=0;
Q=20;
n=length(T);

serie_erro = erro_constante(T,errp,n);
sinal_original_const=serie_erro;
serie_original_const=serie_erro;
serie_erro_ordenada=ordenar(serie_erro);
% A = quantil(serie_erro_ordenada,sinal_original_const,Q);

% Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);

Total = zeros(Q);
posicao = [];
M1 = [];
for i= 1:1000

    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W1 =  Total.matriz;    
    M1 =  [M1 menorcaminho(W1) ];
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = importdata('serie.dat');
tspan = 10.01:0.01:18;
errp=5;
Q=20;
n=length(T);

serie_erro = erro_constante(T,errp,n);
sinal_original_const=serie_erro;
serie_original_const=serie_erro;
serie_erro_ordenada=ordenar(serie_erro);
% A = quantil(serie_erro_ordenada,sinal_original_const,Q);

% Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);

Total = zeros(Q);
posicao = [];
M2 = [];

for i= 1:1000

    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W2 =  Total.matriz;    
    M2 =  [M2 menorcaminho(W2) ];
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = importdata('serie.dat');
tspan = 10.01:0.01:18;
errp=10;
Q=20;
n=length(T);

serie_erro = erro_constante(T,errp,n);
sinal_original_const=serie_erro;
serie_original_const=serie_erro;
serie_erro_ordenada=ordenar(serie_erro);
% A = quantil(serie_erro_ordenada,sinal_original_const,Q);

% Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);

Total = zeros(Q);
posicao = [];
M3 = [];
for i= 1:1000

    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W3 =  Total.matriz;    
    M3 =  [M3 menorcaminho(W3) ];
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = importdata('serie.dat');
tspan = 10.01:0.01:18;
errp=15;
Q=20;
n=length(T);

serie_erro = erro_constante(T,errp,n);
sinal_original_const=serie_erro;
serie_original_const=serie_erro;
serie_erro_ordenada=ordenar(serie_erro);
% A = quantil(serie_erro_ordenada,sinal_original_const,Q);

% Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);

Total = zeros(Q);
posicao = [];
M4 = [];
for i= 1:1000

    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W4 =  Total.matriz;    
    M4 =  [M4 menorcaminho(W4) ];
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = importdata('serie.dat');
tspan = 10.01:0.01:18;
errp=20;
Q=20;
n=length(T);

serie_erro = erro_constante(T,errp,n);
sinal_original_const=serie_erro;
serie_original_const=serie_erro;
serie_erro_ordenada=ordenar(serie_erro);
% A = quantil(serie_erro_ordenada,sinal_original_const,Q);

% Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);

Total = zeros(Q);
posicao = [];
M5 = [];
for i= 1:1000

    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W5 =  Total.matriz;    
    M5 =  [M5 menorcaminho(W5) ];
    
end

M =[M1' M2' M3' M4' M5'];
boxplot(M,'Labels',{'0%','5%','10%','15%','20%'})
