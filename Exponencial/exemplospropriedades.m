clear all
close all
clc
tic
Acaminho = [0 1 0 0 
            3 0 1 0 
            0 1 0 1
            0 3 2 0];
% 
% Asalto = [1 1 0;0 2 1;2 0 0];
% 
% Acentrality  = [0 1 2 1 1
%                 0 0 1 1 0
%                 1 0 0 0 0
%                 0 0 1 0 0
%                 0 0 2 2 0];
% 
% Acoeficiente = [0.0 1 1 2
%                 1 0.0 1 0.0
%                 1 1 0.0 0.0
%                 0 0 0 0.0];
            
%             
            Acoeficienteexemplo = [0.0 0.0 0.1 1.0 0.1
                0.1 0.0 0.0 0.0 0.0
                0.0 0.1 0.0 0.0 0.1
                0.0 0.0 0.0 0.0 0.0
                0.1 0.1 0.0 0.0 0.0];
            
cd C:\Users\jgrel\OneDrive\Desktop\Master\Exponencial\Funcoes
% 
% L =  ave_path_length(Acaminho);%caminho medio
% wC1=coeficiente_a_d_p(Acoeficienteexemplo);
% wC2=coeficiente_agrupamento_direcionado(Acoeficiente);
% clust_coeff(Acoeficiente)
%coeficiente  de agrupamento
% [Ci Q1] = modularity_dir(A);%modularidade
% S1 = saltomedio(Asalto);%Salto medio
% S2 = saltomedio2(Asalto);%Salto medio
BC1=sum(betweenness_wei(Acaminho))/4;
