clc
clear all
close all
% T =  rand(1,9)*5;

T = [3.8    2.5    3.4    2.7    2.2    1.5    2.1   3.4   5.2];

Tinf = T-T*0.2;
Tsup = T*1.2;

Q = 3;
X = sort(T);
q = [3 6 9];
L = zeros(Q,length(T));
for i = 1:Q
   
   L(i,:) = verlin(X(q(i)),length(T));
    
end

L = L';

L(:,2) = L(:,2)-L(:,1);
L(:,3) = L(:,3)-(L(:,2)+L(:,1));
% L(:,4) = L(:,4)-(L(:,3)+(L(:,2)+L(:,1)));
figure 
hold on
a = area(L);
p1 = plot(T,'k-*','LineWidth',2);
xlabel('t','FontSize',20,'FontWeight','bold','Color','k');
ylabel('x(t)','FontSize',20,'FontWeight','bold','Color','k');
xlim([1 9])
ymax = L(1,1)+ L(1,2)+L(1,3);
ylim([0 ymax])

a(1,3).FaceColor = 'b';
a(1,3).FaceAlpha = 0.5;
a(1,2).FaceColor = 'g';
a(1,2).FaceAlpha = 0.5;
a(1,1).FaceColor = 'r';
a(1,2).FaceAlpha = 0.5;
% a(1,4).FaceColor = 'm';
% a(1,4).FaceAlpha = 0.5;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

F = 0.1;
n = length(T);
for i = 1:n
    
    erro(i)=abs(T(i)*F);
    
end

serie_intervalo = zeros(n,3);

for i = 1:n
    
    serie_intervalo(i,1) = T(i)-erro(i) ;%inferior
    
end

for i = 1:n
    
    serie_intervalo(i,2) = T(i);%central
    
end

for i = 1:n
    
    serie_intervalo(i,3) = T(i)+erro(i);%superior
    
end

out =  serie_intervalo;
% p2 = plot(serie_intervalo(:,1),'r--','LineWidth',1);
% p3 = plot(serie_intervalo(:,3),'b--','LineWidth',1);
% legend([p1 p2 p3],{'Valor Médio','Limite Inferior','Limite Superior'},'Location','north')
legend([p1],{'Série temporal'},'Location','north')
set(gca,'fontsize',20,'FontName','Times')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


W =  quantil(X,T,Q);



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

atr =  ['A';'B';'C'];
h = [id id atr]; 

fileID = fopen('nos.csv','w');
fprintf(fileID,'Id Label Atributes\n');
fprintf(fileID,'%d %d %c\n',h');
fclose(fileID);


figure
hold on
p1 = plot(T,'k-*','LineWidth',1);
p2 = plot(Tinf,'r--','LineWidth',1);
p3 = plot(Tsup,'b--','LineWidth',1);
xlabel('t','FontSize',20,'FontWeight','bold','Color','k');
ylabel('x(t)','FontSize',20,'FontWeight','bold','Color','k');
legend([p1 p2 p3],{'Valor Médio','Limite Inferior','Limite Superior'},'Location','north')
set(gca,'fontsize',20,'FontName','Times')
xlim([1 9])
