function out = qintervalo_k(ordenado,original,q,k)

serie_intervalo=ordenado;
sinal_original=original;
serie_original=original;
n=length(serie_intervalo);
Q = q;


t = zeros(n,1);
contador = 0;
for i = 1:n
    for j = 1:n
        if sinal_original(j,:)==serie_intervalo(i,:)
            t(i) = j;
            contador = contador +1;
            sinal_original(j,:) = power(10,12);
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


lquant = serie_intervalo(q(:),2);
lquat = [-inf ;lquant ;+inf];


localizamin = zeros(n,1);

for i = 1:n%adicionando cada elemento no seu quantil e atribuindo as posicoes dos quantis de cada elemento
    for j = 1:Q
        if serie_original(i,1) >= lquat(j) && serie_original(i,1) < lquat(j+1)
            localizamin(i,1) = j;
            
        end
    end
end

localizamax = zeros(n,1);

for i = 1:n%adicionando cada elemento no seu quantil e atribuindo as posicoes dos quantis de cada elemento
    for j = 1:Q
        if serie_original(i,3) >= lquat(j) && serie_original(i,3) < lquat(j+1)
            localizamax(i,1) = j;            
        end
    end
end

L = [localizamin localizamax];

distancia = abs(serie_original(:,3)-serie_original(:,1));

posicao=zeros(n,1);

f=0;
MProba = zeros(n,Q);%matriz probabilidade

for i=1:n
    
    if L(i,1)==L(i,2)
        
         MProba(i,L(i,2))= 1;
    else
        
        for j= L(i,1):L(i,2)
            
            switch j
                
                case L(i,2)
                    
                    MProba(i,j)= abs((lquant(j-1)-serie_original(i,3)))/distancia(i);
                    
                case L(i,1)
                    
                    MProba(i,j)= abs((lquant(j)-serie_original(i,1)))/distancia(i);                    
                    
                otherwise
                    
                    MProba(i,j)= abs((lquant(j)-lquant(j-1)))/distancia(i);
                    
            end
        end
    end
    
end


% r = a + (b-a)*rand();

%sorteando
% 
% r = serie_original(i,1) + (serie_original(i,3)-serie_original(i,1))*rand();

for i=1:n
    
    if find(MProba(i,:)==1)
        
        posicao(i)=L(i,1);
        
        
    else
        
        r = serie_original(i,1) + (serie_original(i,3)-serie_original(i,1))*rand();
        
        for  j = 1:Q-1
            
            if r<=lquant(j)
                posicao(i)=j;
                break
            else
                posicao(i)=j+1;
            end
            
        end
        
    end
        
end
contador = 0;
matrizadj=zeros(Q,Q);
for i = 1:(n-k)% construindo a matriz(ligando os quantis(nos))
 
    matrizadj(posicao(i,1),posicao(i+k,1)) = matrizadj(posicao(i,1),posicao(i+k,1)) + 1;
       contador = contador+1;
end

out.matriz = matrizadj;

out.posicao=posicao;


end