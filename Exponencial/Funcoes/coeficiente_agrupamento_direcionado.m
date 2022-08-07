function CC_medio=coeficiente_agrupamento_direcionado(W1)

%entrada

[n_linhas,n_colunas] = size(W1);

N = n_colunas; 
W=W1;

A  = zeros(N);
for i=1:N
    for j=1:N
        if W(i,j)~=0
            A(i,j) = 1;
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%grau de conectividade direcionado


k_in= zeros(N,1);
k_out= zeros(N,1);
k = zeros(N,1);


for i=1:N
    soma =  0;
    for j=1:N
        if i~=j
        soma = soma+A(j,i); 
        end
    end
    k_in(i)=soma;
end

for i=1:N
    soma =  0;
    for j=1:N
        if i~=j
            soma = soma+A(i,j);
        end
    end
    k_out(i)=soma;
end


soma =  0;
for i=1:N
    k(i) = k_in(i)+k_out(i);
    soma = soma+k(i);     
end

GC_medio=soma/(2*N);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%grau de conectividade direcionado




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

W_norma = zeros(N);
% W_norma =W;
W_soma = zeros(N);
Wbarra = zeros(N);
maximovalor = max(W(:));

for i=1:N
    for j=1:N
        Wbarra(i,j)=W(i,j)/maximovalor;
    end
end

for i=1:N
    for j=1:N
        W_norma(i,j)=(Wbarra(i,j))^1/3;
    end
end

for i=1:N
    for j=1:N
        W_soma(i,j)=W_norma(i,j)+W_norma(j,i);
    end
end
Ar = W;
for i=1:N
    for j=1:N
        if i==j
        Ar(i,j) = 0;
        end
    end
end

A2 = Ar*Ar;
for i = 1:N
    k_d(i)=A2(i,i);    
end

W3 = W_soma^3;
CC = zeros(N,1);


for i=1:N
    if (k(i)*(k(i)-1)-2*k_d(i))==0
        CC(i)=0;
    else
        CC(i)=W3(i,i)/(2*(k(i)*(k(i)-1)-2*k_d(i)));
    end
end
soma = 0;
for i=1:N
    soma = soma+CC(i);
end

CC_medio = soma/N;
end