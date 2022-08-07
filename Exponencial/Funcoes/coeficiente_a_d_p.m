function CC_medio=coeficiente_a_d_p(W1)

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
%densidade
% linhas = 0;
% for i=1:N
%     for j=1:N
%         linhas = linhas+A(i,j);       
%     end
% end
% densidade = linhas/(N*(N-1));

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
%forca de conectividade 


s_in= zeros(N,1);
s_out= zeros(N,1);
s = zeros(N,1);

% Ma1 = A'*W;
% Ma2 = A*W';

for i=1:N
    soma =  0;
    for j=1:N
        if i~=j
        soma = soma+(A(j,i)*W(j,i)); 
        end
    end
    s_in(i)=soma;
end

for i=1:N
    soma =  0;
    for j=1:N
        if i~=j
            soma = soma+(A(i,j)*W(i,j));
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
Ar = A;
Wr = W;

for i=1:N
    for j=1:N
        if i==j
        Ar(i,j) = 0;
        Wr(i,j) = 0;
        end
    end
end


A2 = (Wr*A+A*Wr)/2;


for i = 1:N
    s_d(i)=A2(i,i);    
end


CC = zeros(N,1);

P1 = Wr+Wr';
P2 = Ar+Ar';
P3 = P2*P2;

W3 = P1*P3;

%%%%%%%%%%%%%%
Apeso = W1;
Abinario = zeros(N,N);

for i=1:n_linhas    
    for  j=1:n_linhas        
        if W1(i,j)~=0
            Abinario(i,j)=1;
        end
    end    
end

numerador = ((Apeso+Apeso')*((Abinario+Abinario')^2));

%%%%%%%%%%%%%%


for i=1:N
    if (s(i)*(k(i)-1))-2*s_d(i)==0
        CC(i)=0;
    else
        CC(i)=W3(i,i)/(2*(s(i)*(k(i)-1)-2*s_d(i)));
    end
end
soma = 0;
for i=1:N
    soma = soma+CC(i);
end

CC_medio = soma/N;
end