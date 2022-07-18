vetor = zeros(1,1000);
Matriz = zeros(20,20); 
for i = 1 :20
    for j = 1 :20
        
        for k = 1:1000
            
            vetor(k)=Markov5{k}(i,j);
            Matriz(i,j)=median(vetor);
            
        end
        
    end
end
W = zeros(20,20);
for j=1:20
    soma = 0;
    for i=1:20
        
        soma = soma + Matriz(i,j);
        
    end
    for i=1:20
        
       W(i,j)=Matriz(i,j)/soma;
    end
end