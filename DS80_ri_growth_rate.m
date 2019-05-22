clc;clear;close all
doubling_times_H2_S = [35.6 43.4 51.2];
doubling_times_S_Fe = [57.2 61.1 59.7];
doubling_times_H2_Fe = [57.1 51.6 52];

ringindex_H2_S = [3.96 3.99 3.73];
ringindex_S_Fe = [4.70 4.74 4.69];
ringindex_H2_Fe = [4.2 4.03 4.056];

figure(1)
hold on
xlim([30 67])
plot(doubling_times_H2_S, ringindex_H2_S, 'ko', 'Linewidth', 1.5,'Markersize',7); 
plot(doubling_times_H2_Fe, ringindex_H2_Fe, 'bv', 'Linewidth', 1.5,'Markersize',7); 
plot(doubling_times_S_Fe, ringindex_S_Fe, 'rs', 'Linewidth', 1.5,'Markersize',8); 

xlabel('Doubling Time (hours)'),ylabel('Ring Index (GDGTs 0-6)')
legend('H_2/S^0','H_2/Fe^{3+}','S^0/Fe^{3+}')
