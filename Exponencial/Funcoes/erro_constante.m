function out = erro_constante(serie,f,N)


T = serie;

F=f/100;


n = N;
erro=[];
for i = 1:n
    
    erro(i)=T(i)*F;
    
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