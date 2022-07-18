function out = quantil(ordenado,original,q)

serie_intervalo=ordenado;
sinal_original=original;
serie_original=original;
n=length(serie_intervalo);
Q = q;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = zeros(n,1);
contador = 0;
for i = 1:n
    for j = 1:n
        if sinal_original(j)==serie_intervalo(i)
            t(i) = j;
            contador = contador +1;
            sinal_original(j) = power(10,12);
            break
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%determinando numero de quantis

q = zeros(Q-1,1);
for i = 1:Q-1 %atribuindo os valores dos quantis em um vetor
    q(i) = (n*(i))/Q+1;
    quantcomp = zeros(Q+1,1);
end
%q = q+1;
for i = 2:Q
    quantcomp(1) = 1;% quantcomp(0) = 0;
    quantcomp(i) = q(i-1);% quantcomp(i) = q(i-1);
    quantcomp(Q+1) = n+1;% quantcomp(Q) = length(serie_ordenada);
end

localiza = zeros(n,1);


for i = 1:n%adicionando cada elemento no seu quantil e atribuindo as posicoes dos quantis de cada elemento
    for j = 1:Q
        if i >= quantcomp(j,1) && i < quantcomp(j+1,1)
            localiza(t(i),1) = j;
            
        end
        if i == n
            localiza(t(i),1) = j;
        end
    end
end
%localiza(61,1)=20;
matrizadj = zeros(Q);
contador = 0;
for i = 1:(n-1)% construindo a matriz(ligando os quantis(nos))
 
    matrizadj(localiza(i,1),localiza(i+1,1)) = matrizadj(localiza(i,1),localiza(i+1,1)) + 1;
       contador = contador+1;
end

out =  matrizadj;
end