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

T1  = erro_constante(T,errp(1),n);
T2  = erro_constante(T,errp(2),n);
T3  = erro_constante(T,errp(3),n);
T4  = erro_constante(T,errp(4),n);
T5  = erro_constante(T,errp(5),n);

t{1} = T1;
t{2} = T2;
t{3} = T3;
t{4} = T4;
t{5} = T5;
% r = a + (b-a)*rand();

%sorteando
% 
% r = serie_original(i,1) + (serie_original(i,3)-serie_original(i,1))*rand();
S = [];
Ac = []; 
for h = 1:5
    Ts   = [];
    A = t{1,h};
    for j = 1:1000       
        for i = 1:n
            r = A(i,1) + (A(i,3)-A(i,1))*rand();
            Ts(i,j) = r;   
        end
    end
    Ts5 = [];
    for i =1:1000
        Ts5(i) = median(Ts(i,:));
    end
    Axx = [];
    soma = 0;
    for  k = 1:40
        soma = 0;
        for i = 1:(length(Ts5)-k)

            soma = soma + ((Ts5(i)-mean(Ts5))*(Ts5(i+k)-mean(Ts5)))/var(Ts5);
        end
        Axx(k) = soma/(length(Ts5)-k);
    end
    Ac(h,:) = Axx;
    S(h,:) = Ts5;
end

k = 1:40;

hold on
plot(k,Ac(1,:),'^','Color','k');
plot(k,Ac(2,:),'o','Color','r');
plot(k,Ac(3,:),'d','Color','g');
plot(k,Ac(4,:),'s','Color','b');
plot(k,Ac(5,:),'--','Color','m');
xlim([1 40]);
xlabel('\tau','FontSize',20,'FontWeight','bold','Color','k');
ylabel('A(\tau)','FontSize',20,'FontWeight','bold','Color','k');


legend({'0%','5%','10%','15%','20%'},...
    'Location','north','NumColumns',2)







box on;

dlmwrite('Ac.txt',Ac)


% figure
% tC = linspace(0,0.05,1000);
% hold on
% % plot(tC,T5(:,2),'-','LineWidth',1,'Color','k');
% plot(tC,T5(:,3),'-','LineWidth',1,'Color','r');
% plot(tC,T5(:,1),'-','LineWidth',1,'Color','b');
% xlabel('Time [s]','FontSize',20,'FontName','Times');
% ylabel('Voltage [V]','FontSize',20,'FontName','Times');
% set(gca,'fontsize',20,'FontName','Times')
% legend({'Limite Superior','Limite Inferior'},...
%     'Location','north','FontSize',10,'NumColumns',2)
% grid on;
% box off;
