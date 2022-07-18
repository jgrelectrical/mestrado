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
errp = [0 5 10 15 20];
n=length(T);

cd C:/Users/jgrel/OneDrive/Desktop/apresentacaotese/Newfolder/metodo_novo

Tt = {};
Tt{1}  = erro_constante(T,errp(1),n);
Tt{2}  = erro_constante(T,errp(2),n);
Tt{3}  = erro_constante(T,errp(3),n);
Tt{4}  = erro_constante(T,errp(4),n);
Tt{5}  = erro_constante(T,errp(5),n);


Mt  = {};
CAt = {};
Mot = {};
St =  {};
BCt = {};

cd C:/Users/jgrel/OneDrive/Desktop/apresentacaotese/Newfolder/metodo_novo/Funcoes/Aruane

for j = 1:5
M = [];
CA=[];
Mo=[];
S=[];
BC=[];
serie_erro_ordenada=ordenar(Tt{j});
    for k = 3
        Total = zeros(Q);
        posicao = [];
        M1 = [];
        CA1 = [];
        Modu1 = [];
        S1 = [];
        BC1 = [];
        Matriz1 = zeros(Q);
        for i= 1:1000
            Total = qintervalo_k(serie_erro_ordenada,Tt{j},Q,k);
            W1 =  Total.matriz;
            Matriz1 = Matriz1 + W1;
            M1 =  [M1 ave_path_length(W1)];%caminho medio
            wC1=coeficiente_a_d_p(W1);
            CA1 = [CA1 wC1];%coeficiente  de agrupamento
            [Ci Q1] = modularity_dir(W1);%modularidade
            Modu1 = [Modu1 Q1];
            S1 = [S1 saltomedio(W1)];%Salto medio
            BC1=[BC1 sum(betweenness_wei(W1))/20];
        end
%         M(k) = median(M1);
%         CA(k) = median(CA1);
%         Mo(k) = median(Modu1);
%         S(k) = median(S1);
%         BC(k) = median(BC1);
        
        M = M1;
        CA = CA1;
        Mo = Modu1;
        S = S1;
        BC = BC1;
        
    end
Mt{j}=M;
CAt{j}=CA;
Mot{j}=Mo;
St{j}=S;
BCt{j}=BC;    
end

C1 = CAt{1};
C2 = CAt{2}';
C3 = CAt{3}';
C4 = CAt{4}';
C5 = CAt{5}';
CA =[C2 C3 C4 C5];
boxplot(CA,'Labels',{'5%','10%','15%','20%'},'Colors','k','Symbol','')
xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
ylabel('CC(k)','FontSize',20,'FontWeight','bold','Color','k');
set(gca,'fontsize',20,'FontName','Times')
hline = refline([0 C1(1,1)]);
hline.Color = 'r';
hline.LineStyle = '-';
hold off


% M1 = Mt{1};
% M2 = Mt{2}';
% M3 = Mt{3}';
% M4 = Mt{4}';
% M5 = Mt{5}';
% M =[M2 M3 M4 M5];
% boxplot(M,'Labels',{'5%','10%','15%','20%'},'Colors','k','Symbol','')
% xlabel('Incertezas \delta','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('L(k)','FontSize',20,'FontWeight','bold','Color','k');
% set(gca,'fontsize',20,'FontName','Times')
% hline = refline([0 M1(1,1)]);
% hline.Color = 'r';
% hline.LineStyle = '-';
% dlmwrite('L.txt',M)
% hold off

%1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,Mt{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('L','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% %2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,CAt{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('CC','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% %3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,Mot{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('Modularidade','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% %4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,St{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('\delta','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% %5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,BCt{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('BC','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% 
% toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%










