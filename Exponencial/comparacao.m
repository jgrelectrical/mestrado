%teste do codigo
clear all
close all
clc
tic

cd C:/Users/jgrel/OneDrive/Desktop/apresentacaotese/Newfolder/master_degree-main/master_degree-main/chapter3
load Jerk_circ.txt
tspan = linspace(0,0.1,10000);
T = Jerk_circ(:,1);
T = T(1:5:5000);
Q  = 20;
errp=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T = importdata('serie.dat');
% tspan = 10.01:0.01:18;
% errp=0;
% Q=20;

cd C:/Users/jgrel/OneDrive/Desktop/apresentacaotese/Newfolder/metodo_novo
n=length(T);
serie_erro = erro_constante(T,errp,n);
sinal_original_const=serie_erro;
serie_original_const=serie_erro;
serie_erro_ordenada=ordenar(serie_erro);
% A = quantil(serie_erro_ordenada,sinal_original_const,Q);

% Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);

cd C:/Users/jgrel/OneDrive/Desktop/apresentacaotese/Newfolder/metodo_novo/Funcoes/Aruane   % !!! mudar o nome para cada SET (caminho onde estao seus arquivos)

Total = zeros(Q);
posicao = [];
M1 = [];
CA1 = [];
Modu1 = [];
S1 = [];
BC1 = [];
Matriz1 = zeros(Q);
Markov1   =  {};
for i= 1:1000

    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W1 =  Total.matriz;
    Matriz1 = Matriz1 + W1;
    M1 =  [M1 ave_path_length(W1)];%caminho medio
    wC1=weighted_clust_coeff(W1);
    CA1 = [CA1 sum(wC1)/20];%coeficiente  de agrupamento    
%   B = [B betweenness_wei(W1)];
%   L laplace
    [Ci Q1] = modularity_dir(W1);%modularidade
    Modu1 = [Modu1 Q1];
    S1 = [S1 saltomedio(W1)];%Salto medio
    BC1=[BC1 sum(betweenness_wei(W1))/20];
    Markov1{i} = W1;
end










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5
% T = importdata('serie.dat');
% tspan = 10.01:0.01:18;
errp=10;
% Q=20;
% n=length(T);

serie_erro = erro_constante(T,errp,n);
sinal_original_const=serie_erro;
serie_original_const=serie_erro;
serie_erro_ordenada=ordenar(serie_erro);
% A = quantil(serie_erro_ordenada,sinal_original_const,Q);

% Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);

Total = zeros(Q);
posicao = [];
M5 = [];
CA5 = [];
Modu5 = [];
S5 = [];
BC5 = [];
Matriz5 = zeros(Q);
Markov5 = {};
for i= 1:1000


    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W5 =  Total.matriz;
    Matriz5 = Matriz5 + W5;
    M5 =  [M5 ave_path_length(W5)];%caminho medio
    wC5=weighted_clust_coeff(W5);
    CA5 = [CA5 sum(wC5)/20];%coeficiente  de agrupamento    
%   B = [B betweenness_wei(W1)];
%   L laplace
    [Ci Q5] = modularity_dir(W5);%modularidade
    Modu5 = [Modu5 Q5];
    S5 = [S5 saltomedio(W5)];%Salto medio
    BC5=[BC5 sum(betweenness_wei(W5))/20];
    Markov5{i} = W5;
    
end










figure
M =[M1' M5'];
boxplot(M,'Labels',{'0%','20%'})
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('L','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
%%%%%%%%%%%
figure
S =[S1' S5'];
boxplot(S,'Labels',{'0%','20%'})
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('\Delta','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
%%%%%%%%%%%
figure
CA =[CA1' CA5'];
boxplot(CA,'Labels',{'0%','20%'})
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('CC','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
%%%%%%%%%%%
figure
Modu =[Modu1' Modu5'];
boxplot(Modu,'Labels',{'0%','20%'})
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('M','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
%%%%%%%%%%%
figure
BC =[BC1' BC5'];
boxplot(BC,'Labels',{'0%','20%'})
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('BC','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
%%%%%%%%%%%
toc



% figure
% hold on
% % h1 = histogram(S1);
% % h1.FaceColor = 'r';
% h2=histogram(BC2,'Normalization','probability');
% h2.FaceColor = 'b';
% h3=histogram(BC3,'Normalization','probability');
% h3.FaceColor = 'g';
% h4=histogram(BC4,'Normalization','probability');
% h4.FaceColor = 'k';
% h5=histogram(BC5,'Normalization','probability');
% h5.FaceColor = 'm';
% hold off
% legend({'5%','10%','15%','20%'},...
%     'Location','north','NumColumns',2)

figure
vetor = zeros(1,1000);
Matriz = zeros(20,20); 
for i = 1 :20
    for j = 1 :20
        
        for k = 1:1000
            
            vetor(k)=Markov1{k}(i,j);
            Matriz(i,j)=median(vetor);
            
        end
        
    end
end
Wtotal = zeros(20,20);
for j=1:20
    soma = 0;
    for i=1:20
        
        soma = soma + Matriz(i,j);
        
    end
    for i=1:20
        
       Wtotal(i,j)=Matriz(i,j)/soma;
    end
end
imagesc(Wtotal);
colormap(flipud(hot));
colorbar;

xlabel('Vértice j','FontSize',20,'FontWeight','bold','Color','k');
ylabel('Vértice i','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
