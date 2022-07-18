function CC_medio=coeficiente_agrupamento_direcionado(W1)

%entrada

N=20;
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
%densidade
linhas = 0;
for i=1:N
    for j=1:N
        linhas = linhas+A(i,j);       
    end
end
densidade = linhas/(N*(N-1));

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


s_in= zeros(N,1);
s_out= zeros(N,1);
s = zeros(N,1);


for i=1:N
    soma =  0;
    for j=1:N
        if i~=j
        soma = soma+W(j,i); 
        end
    end
    s_in(i)=soma;
end

for i=1:N
    soma =  0;
    for j=1:N
        if i~=j
            soma = soma+W(i,j);
        end
    end
    s_out(i)=soma;
end


soma =  0;
for i=1:N
    s(i) = s_in(i)+s_out(i);
    soma = soma+s(i);     
end

s_total=soma/(2*N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

W_norma = zeros(N);
W_soma = zeros(N);

for i=1:N
    for j=1:N
        if i~=j
        W_norma(i,j)=(W(i,j))^1/3;
        end
    end
end

for i=1:N
    for j=1:N
        if i~=j
        W_soma(i,j)=W_norma(i,j)+W_norma(j,i);
        end
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

W2 = W_soma*W_soma;
W3 = W2*W_soma;
CC = zeros(N,1);


for i=1:N
    if (s(i)*(s(i)-1))-2*k_d(i)==0
        CC(i)=0;
    else
        CC(i)=W3(i,i)/(2*(s(i)*(s(i)-1)-2*k_d(i)));
    end
end
soma = 0;
for i=1:N
    soma = soma+CC(i);
end

CC_medio = soma/N;
end