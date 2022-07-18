function out = ordenar(sinal)

serie_intervalo = sinal;
n=length(serie_intervalo);

for i=1:n
    
    ja_ordenado = true;
    
    for j = 1:n-i
        
        if serie_intervalo(j,2) > serie_intervalo(j+1,2)
            
            
            [serie_intervalo(j,:),serie_intervalo(j+1,:)] = deal(serie_intervalo(j+1,:),serie_intervalo(j,:));
            
            ja_ordenado = false;
            
        end
    end
    if ja_ordenado ==  true
        break;
    end
end

out =  serie_intervalo;
end