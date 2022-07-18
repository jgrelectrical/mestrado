% figure
% hold on
% histogram(M2)
% histogram(M3)
% histogram(M4)
% histogram(M5)
% histogram(M1)
% 
% legend('5%','10%','15%','20%','0%')
% 
% hold  off

figure

hold on
h2 = histogram(CA2);
h3 = histogram(CA3);
h4 = histogram(CA4);
h5 = histogram(CA5);

h2.Normalization = 'probability';
h2.BinWidth = 0.001;
h3.Normalization = 'probability';
h3.BinWidth = 0.001;
h4.Normalization = 'probability';
h4.BinWidth = 0.001;
h5.Normalization = 'probability';
h5.BinWidth = 0.001;

h4.FaceColor = 'g';
h4.EdgeColor = 'k';

h3.FaceColor = 'r';
h3.EdgeColor = 'k';

h5.FaceColor = 'k';
h5.EdgeColor = 'k';

legend('5%','10%','15%','20%')

hold  off