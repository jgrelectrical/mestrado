function out = incertezas(serie,L,t,N)


T = serie;

LLE=L;

tspan = t;

n = N;
for i = 1:n
    
    erro(i)=10^(log10(1e-16)+tspan(i)*LLE);
    
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
end