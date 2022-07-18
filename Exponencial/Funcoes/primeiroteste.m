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
for i= 1:1

    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W1 =  Total.matriz;    
    M1 =  ave_path_length(W1);%caminho medio
    wC=weighted_clust_coeff(W1);
    CA = sum(wC)/20;%coeficiente  de agrupamento
%     B = betweenness_wei(W1);
    [Ci Q] = modularity_dir(W1);%modularidade
    simples = adj2simple(W1);
    Lap = laplacian_matrix(simples);
    
end