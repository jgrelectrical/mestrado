% %1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,Mt{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('L','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% %2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,CAt{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('CC','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% %3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,Mot{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('Modularidade','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% %4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,St{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('\Delta','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off
% %5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% k = 1:25;
% figure
% hold on
% for i = 1:5
%     plot(k,BCt{i})
% end
% xlim([1 25]);
% xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
% ylabel('BC','FontSize',20,'FontWeight','bold','Color','k');
% legend({'0%','5%','10%','15%','20%'},'Location','north','NumColumns',2)
% hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%0
% k = 1:25;
% 
for i = 5
    figure
    hold on
    plot(k,Mt{i})
    plot(k,CAt{i})
    plot(k,Mot{i})
    plot(k,St{i})
    plot(k,BCt{i})
    xlim([1 25]);
    xlabel('k','FontSize',20,'FontWeight','bold','Color','k');
    ylabel('Métricas','FontSize',20,'FontWeight','bold','Color','k');
    legend({'L','CC','Modularidade','Salto','Centralidade'},'Location','north','NumColumns',2)
    hold off
end














