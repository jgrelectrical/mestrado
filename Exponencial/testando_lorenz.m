%teste do codigo
clear all
close all
clc
tic
%entrada%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T = [0.6764    0.4511    0.4358    0.1277    0.1908    0.8762   0.8421  0.6168    0.3397    0.2463    0.1082    0.3020];

% LLE = 0.9056;
% n=length(T);
% tspan = 7:1:18;
% Q=4;

T = importdata('serie.dat');
Tordenado = sort(T);
tspan = 0.01:0.01:42;
LLE = 0.3935;
Q=30;
n=length(T);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculo das incertezas e dos limites inferiores e superiores
serie_intervalo=incertezas(T,LLE,tspan,n);
sinal_original=serie_intervalo;
serie_original=serie_intervalo;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ordenando a serie

serie_ordenada=ordenar(serie_intervalo);
serie_erro_ordenada = serie_ordenada;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%metodo dos quantis tradicional

B = quantil(serie_ordenada,sinal_original,Q);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%qauntil com incertezas

cd C:\Users\jgrel\OneDrive\Desktop\Master\Exponencial\Funcoes


    
menor_caminho = [];
coeficiente_a = [];
modularidade = [];
salto = [];
intermediacao=[];

ordenado = [Tordenado Tordenado Tordenado];
original = [T T T];
for k = 1
    
%   saida = qintervalo_k(serie_erro_ordenada,sinal_original,Q,k);
    saida = qintervalo_k(ordenado,original,Q,k);
    saida2 = quantil_k(serie_ordenada,sinal_original,Q,k);
    A = saida.matriz;
    menor_caminho = [menor_caminho ave_path_length(A)];
    coeficiente_a = [coeficiente_a coeficiente_a_d_p(A)];
    [modula1 MV] = modularity_dir(A);
    modularidade = [modularidade MV];
    salto = [salto saltomedio(A)];
    intermediacao=[intermediacao sum(betweenness_wei(A))/30];
    
end
dlmwrite('QGL.txt',menor_caminho)
dlmwrite('QGCA.txt',coeficiente_a)
dlmwrite('QGMo.txt',modularidade)
dlmwrite('QGS.txt',salto)
dlmwrite('QGBC.txt',intermediacao)
M = [];
CA=[];
Mo=[];
S=[];
BC=[];
Markov = {};
for k = 1
    Total = zeros(Q);
    posicao = [];
    M1 = [];
    CA1 = [];
    Modu1 = [];
    S1 = [];
    BC1 = [];
    Matriz1 = zeros(Q);
    for i= 1:400
        Total = qintervalo_k(serie_erro_ordenada,sinal_original,Q,k);
        W1 =  Total.matriz;
        Matriz1 = Matriz1 + W1;
        M1 =  [M1 ave_path_length(W1)];%caminho medio
        wC1=coeficiente_a_d_p(W1);
        CA1 = [CA1 wC1];%coeficiente  de agrupamento
        [Ci Q1] = modularity_dir(W1);%modularidade
        Modu1 = [Modu1 Q1];
        S1 = [S1 saltomedio(W1)];%Salto medio
        BC1=[BC1 sum(betweenness_wei(W1))/30];
        Markov{i} = W1;
        
    end
   
    M = M1;
    CA = CA1;
    Mo = Modu1;
    S = S1;
    BC = BC1;
    
    
    Mt{k}=M;
    CAt{k}=CA;
    Mot{k}=Mo;
    St{k}=S;
    BCt{k}=BC;
    k
end
% 
L = zeros(400,k);
CC = zeros(400,k);
Mo = zeros(400,k);
S = zeros(400,k);
BC = zeros(400,k);
% 
% for i = 1:20
%     
%     L(:,i) = Mt{i}';
%     CC(:,i) = CAt{i}';
%     Mo(:,i) = Mot{i}';
%     S(:,i) = St{i}';
%     BC(:,i) = BCt{i}';
%     
% end
% 
% dlmwrite('boxL.txt',L)
% dlmwrite('boxCA.txt',CC)
% dlmwrite('boxMo.txt',Mo)
% dlmwrite('boxS.txt',S)
% dlmwrite('boxBC.txt',BC)
% 
% 
% 
% 
% 
% 
% 
L = M1;
CC = CA1;
Mo = Modu1;
S = S1;
BC = BC1;
% % 
% % % for i = 1:35
% % %     
% % %     L(:,i) = Mt{i}';
% % %     CC(:,i) = CAt{i}';
% % %     Mo(:,i) = Mot{i}';
% % %     S(:,i) = St{i}';
% % %     BC(:,i) = BCt{i}';
% % %     
% % % end
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
boxplot(L(:,1))
xlabel('K','FontSize',15,'FontWeight','bold','Color','k');
ylabel('L','FontSize',15,'FontWeight','bold','Color','k');
set(gca,'fontsize',13,'FontName','Times')
hline = refline([0 menor_caminho(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
boxplot(CC)
xlabel('K','FontSize',20,'FontWeight','bold','Color','k');
ylabel('CC','FontSize',17,'FontWeight','bold','Color','k');
set(gca,'fontsize',17,'FontName','Times')
hline = refline([0 coeficiente_a(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
boxplot(Mo)
xlabel('K','FontSize',20,'FontWeight','bold','Color','k');
ylabel('M_o','FontSize',17,'FontWeight','bold','Color','k');
set(gca,'fontsize',17,'FontName','Times')
hline = refline([0 modularidade(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
boxplot(S)
xlabel('K','FontSize',20,'FontWeight','bold','Color','k');
ylabel('\Delta','FontSize',17,'FontWeight','bold','Color','k');
set(gca,'fontsize',17,'FontName','Times')
hline = refline([0 salto(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
boxplot(BC)
xlabel('K','FontSize',20,'FontWeight','bold','Color','k');
ylabel('BC','FontSize',17,'FontWeight','bold','Color','k');
set(gca,'fontsize',17,'FontName','Times')
hline = refline([0 intermediacao(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
hold off
% % 
% % dlmwrite('boxL.txt',L)
% % dlmwrite('boxCA.txt',CC)
% % dlmwrite('boxMo.txt',Mo)
% % dlmwrite('boxS.txt',S)
% % dlmwrite('boxBC.txt',BC)
% % 
% % M = M1;
% % CA = CA1;
% % Mo = Modu1;
% % S = S1;
% % BC = BC1;
% 
% 
% L = zeros(1000,k);
% CC = zeros(1000,k);
% Mo = zeros(1000,k);
% S = zeros(1000,k);
% BC = zeros(1000,k);
% for i  = 1:1000
%       
%     L(i) = median(M1(1:i));
%     CC(i)= median(CA1(1:i));
%     Mo(i)= median(Modu1(1:i));
%     S(i) = median(S1(1:i));
%     BC(i)= median(BC1(1:i));
%     
% end
% % 
% % 
% dlmwrite('coverL.txt',L)
% dlmwrite('coverCA.txt',CC)
% dlmwrite('coverMo.txt',Mo)
% dlmwrite('coverS.txt',S)
% dlmwrite('coverBC.txt',BC)
% % 
% % 
% % W = W1;
% % H = [];
% % c = 1;
% % for i= 1:Q
% %     for j= 1:Q
% %         if W(i,j)>0
% %             H(c,1) = i;
% %             H(c,2) = j;
% %             H(c,3) = W(i,j);
% %             c = c+1;
% %         end
% %     end
% % end
% % 
% % 
% % 
% % fileID = fopen('rede.csv','w');
% % fprintf(fileID,'source target weight\n');
% % fprintf(fileID,'%d %d %.8f\n',H');
% % fclose(fileID);
% % 
% % id = zeros(Q,1);
% % atr = [];
% % for z = 1:Q
% %     id(z) = z; 
% %     atr(z) = ['A'];
% % end
% % 
% % h = [id id atr']; 
% % 
% % fileID = fopen('nos.csv','w');
% % fprintf(fileID,'Id Label Atributes\n');
% % fprintf(fileID,'%d %d %c\n',h');
% % fclose(fileID);
% % 
% % 
figure
vetor = zeros(1,400);
Matriz = zeros(30,30); 
for i = 1 :30
    for j = 1 :30
        
        for k = 1:400
            
            vetor(k)=Markov{k}(i,j);
            Matriz(i,j)=median(vetor);
            
        end
        
    end
end
Wtotal = zeros(30,30);
for j=1:30
    soma = 0;
    for i=1:30
        
        soma = soma + Matriz(i,j);
        
    end
    for i=1:30
        
       Wtotal(i,j)=Matriz(i,j)/soma;
    end
end
imagesc(Wtotal);
colormap(flipud(hot));
colorbar;

dlmwrite('Wint.txt',Wtotal)





figure
Matriz = A; 
Wtotal = zeros(30,30);
for j=1:30
    soma = 0;
    for i=1:30
        
        soma = soma + Matriz(i,j);
        
    end
    for i=1:30
        
       Wtotal(i,j)=Matriz(i,j)/soma;
    end
end
imagesc(Wtotal);
colormap(flipud(hot));
colorbar;

dlmwrite('Wsem.txt',Wtotal)

% % 
% % 
% toc
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 






% V = A;
% P =W1;
% 
% for i=1:30
%     V(i,i)=0;
%     P(i,i)=0;
% end


W = W1;
H = [];
c = 1;
for i= 1:Q
    for j= 1:Q
        if W(i,j)>0
            H(c,1) = i;
            H(c,2) = j;
            H(c,3) = W(i,j);
            c = c+1;
        end
    end
end



fileID = fopen('rede.csv','w');
fprintf(fileID,'source target weight\n');
fprintf(fileID,'%d %d %.8f\n',H');
fclose(fileID);

id = zeros(Q,1);
for z = 1:Q
    id(z) = z; 
end

% atr =  ['A';'B';'C'];
% h = [id id atr]; 

h = [id id];
fileID = fopen('nos.csv','w');
fprintf(fileID,'Id Label\n');
fprintf(fileID,'%d %d\n',h');
fclose(fileID);

% 
% figure
% hold on
% p1 = plot(T,'k-*','LineWidth',1);
% p2 = plot(Tinf,'r--','LineWidth',1);
% p3 = plot(Tsup,'b--','LineWidth',1);
% xlabel('t','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('x(t)','FontSize',20,'FontWeight','bold','Color','k');
% legend([p1 p2 p3],{'Valor Médio','Limite Inferior','Limite Superior'},'Location','north')
% set(gca,'fontsize',20,'FontName','Times')
% xlim([1 9])



W = A;
H = [];
c = 1;
for i= 1:Q
    for j= 1:Q
        if W(i,j)>0
            H(c,1) = i;
            H(c,2) = j;
            H(c,3) = W(i,j);
            c = c+1;
        end
    end
end



fileID = fopen('rede2.csv','w');
fprintf(fileID,'source target weight\n');
fprintf(fileID,'%d %d %.8f\n',H');
fclose(fileID);

id = zeros(Q,1);
for z = 1:Q
    id(z) = z; 
end

% atr =  ['A';'B';'C'];
% h = [id id atr]; 

h = [id id];
fileID = fopen('nos2.csv','w');
fprintf(fileID,'Id Label\n');
fprintf(fileID,'%d %d\n',h');
fclose(fileID);









