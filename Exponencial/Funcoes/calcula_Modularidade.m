clc
clear all
close all

m = 20;  %numero de vertices
Mod = zeros(12,25);



for kk = 1:25  % numero de k's (taus) do mapeamento
    
    for k = 1:12   % numero de arquivos (individuos)
        
        cd C:\Users\felipe.teles\Desktop\Modularidade\Arquivos\SETB   % !!! mudar o nome para cada SET (caminho onde estao seus arquivos)
        
        number = num2str(k);
        number2 = num2str(kk);
        file = strcat('hcp',number,'k',number2,'.txt');    % nomes dos arquivos, exemplos: hop1k1.txt, hcp1k1.txt, sop1k1.txt e scpik1.txt
        
        MA = zeros(m,m);
        
        MA = load(file);
        
        cd C:\Users\felipe.teles\Desktop\Modularidade\Funcoes\Aruane       % caminho onde estao todos as funcoes do Matlab
        
        MA=adj2simple(MA);  % removendo auto-conexoes e pesos
        
        [Ci Q] = modularity_dir(MA);
        
        Mod(k,kk)= Q; % cada coluna eh um kk do mapeamento (tau)
        
        
    end
    
    
end

ModFinal = zeros(25,1);

cd C:\Users\felipe.teles\Desktop\Modularidade\Resultados      % caminho onde os resultados da modularidade estarao

 fid = fopen('Modularidadehck1a25.txt','w');   % !!! mudar o nome para cada SET
 
 for ii = 1:25
     ModFinal(ii,1)=sum(Mod(:,ii))/12;
     fprintf(fid,'%8.6f %8.6f\n',ii,ModFinal(ii,1));
 end
 fclose(fid);



    

    
   




