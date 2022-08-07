%calcular_matriz

%     float P[m][n],T[m][n],M[m][n],W[m][n],traco;
%     double salto;
%     calcula_matriz_w(n,m,MA,W);
%     calcula_matriz_transposta(n,m,W,T);
%     calcula_matriz_p(n,m,P);
%     calcula_multiplicacao(n,P,T,M);
%     traco=calcula_traco(n,m,M);
%     salto=(double)traco/n_vertices;

function out = saltomedio(Peso)


MA = Peso;
[n_linhas,n_colunas] = size(MA);

N = n_colunas; 
%matriz adj.
A = zeros(N,N);

for i=1:n_linhas
    
    for  j=1:n_linhas
        
        if MA(i,j)~=0
            A(i,j)=1;
        end
    end
    
end


%%%%calcula_matriz_w(n,m,MA,W);

W = zeros(N);
P = zeros(N);
T = zeros(N);

for i=1:N
    soma = 0;
    for j=1:N
        
        soma = soma + MA(i,j);
        
    end
    for j=1:N
        
       W(i,j)=MA(i,j)/soma;
    end
end


%     calcula_matriz_transposta(n,m,W,T);

T = W';
%     calcula_matriz_p(n,m,P);

for i=1:N
    for j=1:N
          P(i,j)=abs(i-j);
    end
end


%     calcula_multiplicacao(n,P,T,M);


M = P*T;

%     traco=calcula_traco(n,m,M);

traco =  trace(M);

%     salto=(double)traco/n_vertices;

out = traco/N;










end