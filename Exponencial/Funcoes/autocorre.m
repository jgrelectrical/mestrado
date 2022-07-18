%autocorrelacao
clc
cd C:/Users/jgrel/OneDrive/Desktop/apresentacaotese/Newfolder/master_degree-main/master_degree-main/chapter3
load Jerk_circ.txt
T = Jerk_circ(:,1);
T = T(1:5:5000);
Axx = [];
soma = 0;
for  k = 1:40
    soma = 0;
    for i = 1:(length(T)-k)
        
        soma = soma + ((T(i)-mean(T))*(T(i+k)-mean(T)))/var(T);
    end
    Axx(k) = soma/(length(T)-k);
end
k = 1:40;
plot(k,Axx);
xlim([1 40]);
xlabel('\tau','FontSize',20,'FontWeight','bold','Color','k');
ylabel('A(\tau)','FontSize',20,'FontWeight','bold','Color','k');

