clc
clear all
close all

m = 20;  %numero de vertices
Mod = zeros(12,25);



for kk = 1:25  % numero de k's (taus) do mapeamento
    
    for k = 1:12   % numero de arquivos (individuos)
        
        cd C:/Users/aruane.pineda/Desktop/Coeficiente_matlab/Arquivos/SETA   % !!! mudar o nome para cada SET (caminho onde estao seus arquivos)
        
        number = num2str(k);
        number2 = num2str(kk);
        file = strcat('hop',number,'k',number2,'.txt');    % nomes dos arquivos, exemplos: hop1k1.txt, hcp1k1.txt, sop1k1.txt e scpik1.txt
        
        MA = zeros(m,m);
        
        MA = load(file);
        
        cd C:/Users/aruane.pineda/Desktop/Coeficiente_matlab/Funcoes/Aruane      % caminho onde estao todos as funcoes do Matlab
        
        MA=adj2simple(MA);  % removendo auto-conexoes e pesos
        
        [C1 C2 C] = clust_coeff(MA);
        
       % Mod(k,kk)= Q; % cada coluna eh um kk do mapeamento (tau)
        
        
    end
    
    
end

C1
C2
C
%ModFinal = zeros(25,2);

%cd C:/Users/aruane.pineda/Desktop/Coeficiente_matlab/Resultados      % caminho onde os resultados da modularidade estarao

%fid = fopen('coeficientehok1a25.txt','w');   % !!! mudar o nome para cada SET

% 
% for ii = 1:25
%     ModFinal(ii,2)=sum(Mod(:,ii));
% end
% 
% ModFinal(:,2) = ModFinal(:,2)/12;   % 12 eh o numero de pacientes
% 
% for ii = 1:25
%     fprintf(fid,'%d %8.6f\n',ii,ModFinal(ii,2));
% end

%fclose(fid);



    

    
   




