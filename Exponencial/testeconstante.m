%teste do codigo
clear all
close all
clc
tic

load Jerk_circ.txt
tspan = linspace(0,0.1,10000);
T = Jerk_circ(:,1);
T = T(1:5:5000);
Q  = 20;
errp=0;
k=1 ;
%%%%%%%%%%%%%
figure
tC = linspace(0,0.1,10000);
tC = tC(1:5:5000);
plot(tC,T,'-','LineWidth',2,'Color',[0 0 0]);
xlabel('Tempo (s)','FontSize',20,'FontName','Times');
ylabel('Tensão (V)','FontSize',20,'FontName','Times');
set(gca,'fontsize',20,'FontName','Times') 
grid on;
box off;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T = importdata('serie.dat');
% tspan = 10.01:0.01:18;
% errp=0;
% Q=20;



n=length(T);
serie_erro = erro_constante(T,errp,n);
sinal_original_const=serie_erro;
serie_original_const=serie_erro;
serie_erro_ordenada=ordenar(serie_erro);
% A = quantil(serie_erro_ordenada,sinal_original_const,Q);

% Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);

cd C:\Users\jgrel\OneDrive\Desktop\Master\Exponencial\Funcoes  % !!! mudar o nome para o caminho onde estao seus arquivos

Total = zeros(Q);
posicao = [];
M1 = [];
CA1 = [];
Modu1 = [];
S1 = [];
BC1 = [];
Matriz1 = zeros(Q);
Markov1   =  {};
for i= 1:1

    Total = qintervalo(serie_erro_ordenada,sinal_original_const,Q);
    W1 =  Total.matriz;
    Matriz1 = Matriz1 + W1;
    M1 =  [M1 ave_path_length(W1)];%caminho medio
    wC1=coeficiente_a_d_p(W1);
    CA1 = [CA1 wC1];%coeficiente  de agrupamento    
%   B = [B betweenness_wei(W1)];
%   L laplace
    [Ci Q1] = modularity_dir(W1);%modularidade
    Modu1 = [Modu1 Q1];
    S1 = [S1 saltomedio(W1)];%Salto medio
    BC1=[BC1 sum(betweenness_wei(W1))/20];
    Markov1{i} = W1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2
% % toc
% T = importdata('serie.dat');
% tspan = 10.01:0.01:18;
errp=5;
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
M2 = [];
CA2 = [];
Modu2 = [];
S2 = []; 
BC2 = [];
Matriz2 = zeros(Q);
Markov2={};
for i= 1:5000

    Total = qintervalo_k(serie_erro_ordenada,sinal_original_const,Q,k);
    W2 =  Total.matriz;
    Matriz2 = Matriz2 + W2;
    M2 =  [M2 ave_path_length(W2)];%caminho medio
    wC2=coeficiente_a_d_p(W2);
    CA2 = [CA2 wC2];%coeficiente  de agrupamento    
%   B = [B betweenness_wei(W1)];
%   L laplace
    [Ci Q2] = modularity_dir(W2);%modularidade
    Modu2 = [Modu2 Q2];
    S2 = [S2 saltomedio(W2)];%Salto medio
    BC2=[BC2 sum(betweenness_wei(W2))/20]; 
    Markov2{i} = W2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3
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
M3 = [];
CA3 = [];
Modu3 = [];
S3 = [];
BC3 = [];
Matriz3 = zeros(Q);
Markov3={};
for i= 1:1000

    Total = qintervalo_k(serie_erro_ordenada,sinal_original_const,Q,k);
    W3 =  Total.matriz;
    Matriz3 = Matriz3 + W3;
    M3 =  [M3 ave_path_length(W3)];%caminho medio
    wC3=coeficiente_a_d_p(W3);
    CA3 = [CA3 wC3 ];%coeficiente  de agrupamento    
%   B = [B betweenness_wei(W1)];
%   L laplace
    [Ci Q3] = modularity_dir(W3);%modularidade
    Modu3 = [Modu3 Q3];
    S3 = [S3 saltomedio(W3)];%Salto medio
    BC3=[BC3 sum(betweenness_wei(W3))/20];
    Markov3{i} = W3;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4
% T = importdata('serie.dat');
% tspan = 10.01:0.01:18;
errp=15;
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
M4 = [];
CA4 = [];
Modu4 = [];
S4 = [];
BC4 = [];
Matriz4 = zeros(Q);
Markov4={};
for i= 1:1000


    Total = qintervalo_k(serie_erro_ordenada,sinal_original_const,Q,k);
    W4 =  Total.matriz;
    Matriz4 = Matriz4 + W4;
    M4 =  [M4 ave_path_length(W4)];%caminho medio
    wC4=coeficiente_a_d_p(W4);
    CA4 = [CA4 wC4];%coeficiente  de agrupamento    
%   B = [B betweenness_wei(W1)];
%   L laplace
    [Ci Q4] = modularity_dir(W4);%modularidade
    Modu4 = [Modu4 Q4];
    S4 = [S4 saltomedio(W4)];%Salto medio
    BC4=[BC4 sum(betweenness_wei(W4))/20];
    Markov4{i} = W4;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5
% T = importdata('serie.dat');
% tspan = 10.01:0.01:18;
errp=20;
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


    Total = qintervalo_k(serie_erro_ordenada,sinal_original_const,Q,k);
    W5 =  Total.matriz;
    Matriz5 = Matriz5 + W5;
    M5 =  [M5 ave_path_length(W5)];%caminho medio
    wC5=coeficiente_a_d_p(W5);
    CA5 = [CA5 wC5];%coeficiente  de agrupamento    
%   B = [B betweenness_wei(W1)];
%   L laplace
    [Ci Q5] = modularity_dir(W5);%modularidade
    Modu5 = [Modu5 Q5];
    S5 = [S5 saltomedio(W5)];%Salto medio
    BC5=[BC5 sum(betweenness_wei(W5))/20];
    Markov5{i} = W5;
    
end


figure
hold on
M =[M2' M3' M4' M5'];
boxplot(M,'Labels',{'5%','10%','15%','20%'},'Colors','k','Symbol','')
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('L(k)','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
hline = refline([0 M1(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
%legend('QG','Location','northwest')
hold off
print('L.png','-dpng','-r300');
%%%%%%%%%%%
figure
S =[S2' S3' S4' S5'];
fs1 = boxplot(S,'Labels',{'5%','10%','15%','20%'},'Colors','k','Symbol','');
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('\Delta(k)','FontSize',20,'FontWeight','bold','Color','k');
ylim([0.3 0.9])
set(gca,'fontsize',20,'FontName','Times')
hline = refline([0 S1(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
%legend('QG','Location','northwest')
hold off
print('S.png','-dpng','-r300');
%%%%%%%%%%%
figure
CA =[CA2' CA3' CA4' CA5'];
boxplot(CA,'Labels',{'5%','10%','15%','20%'},'Colors','k','Symbol','')
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('CC(k)','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
hline = refline([0 CA1(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
%legend('QG','Location','northwest')
hold off
print('CA.png','-dpng','-r300');
%%%%%%%%%%%
figure
Modu =[Modu2' Modu3' Modu4' Modu5'];
boxplot(Modu,'Labels',{'5%','10%','15%','20%'},'Colors','k','Symbol','')
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('M(k)','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
hline = refline([0 Modu1(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
%legend('QG','Location','northwest')
hold off
print('M.png','-dpng','-r300');
%%%%%%%%%%%
figure
BC =[BC2' BC3' BC4' BC5'];
boxplot(BC,'Labels',{'5%','10%','15%','20%'},'Colors','k','Symbol','')
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('BC(k)','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
hline = refline([0 BC1(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
%legend('QG','Location','northwest')
hold off
print('BC.png','-dpng','-r300');
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
            
            vetor(k)=Markov4{k}(i,j);
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

xlabel('Vértice n_j','FontSize',20,'FontWeight','bold','Color','k');
ylabel('Vértice n_i','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')

dlmwrite('W0.csv',W1)
dlmwrite('W5.csv',W2)
dlmwrite('W10.csv',W3)
dlmwrite('W15.csv',W4)
dlmwrite('W20.csv',W5)
















