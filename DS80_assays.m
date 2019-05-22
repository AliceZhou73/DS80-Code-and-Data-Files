% Results of activity assays for 1) production of H2S (from H2/S couple)
% and 2) production of Fe2+ (from H2/Fe3+ and S/Fe3+ couples). In the Excel
% sheet, data should be ordered thus: S/Fe3+ triplicates --> H2/Fe3+
% triplicates --> H2/S triplicates

clc;clear;close all
% filename = input('Enter path to file in single quotes:  ');
% sheet = input('Enter sheet number, e.g. 1, 2, etc:   ');
% strains = input('Enter number of samples:  '); % e.g. total number of different conditions
% [numeric,text_only,all_data] = xlsread(filename,sheet,'','basic'); % loads data as cell array

filename = 'DS80 Growth.xlsx'
sheet = 1;
strains = 9; % total number of different samples
[numeric,text_only,all_data] = xlsread(filename,sheet,'','basic'); % loads data as cell array


all_data
data_no_headers = all_data;
data_no_headers(1,:) = []; % deletes text headers
times = data_no_headers(:,2); % extracts 'time elapsed' column from Excel file
times = cell2mat(times); % convert cell array to ordinary array for manipulation
absorbances = data_no_headers(:,6); % extracts absorbance values (post-correction for dilution) from Excel file
absorbances = cell2mat(absorbances);

SFe_1_times = times(1:strains:length(times));
SFe_2_times = times(2:strains:length(times));
SFe_3_times = times(3:strains:length(times));

H2Fe_1_times = times(4:strains:length(times));
H2Fe_2_times = times(5:strains:length(times));
H2Fe_3_times = times(6:strains:length(times));

H2S_1_times = times(7:strains:length(times));
H2S_2_times = times(8:strains:length(times));
H2S_3_times = times(9:strains:length(times));

SFe_1_absorbance = absorbances(1:strains:length(absorbances));
SFe_2_absorbance = absorbances(2:strains:length(absorbances));
SFe_3_absorbance = absorbances(3:strains:length(absorbances));
H2Fe_1_absorbance = absorbances(4:strains:length(absorbances));
H2Fe_2_absorbance = absorbances(5:strains:length(absorbances));
H2Fe_3_absorbance = absorbances(6:strains:length(absorbances));
H2S_1_absorbance = absorbances(7:strains:length(absorbances));
H2S_2_absorbance = absorbances(8:strains:length(absorbances));
H2S_3_absorbance = absorbances(9:strains:length(absorbances));

figure(1) % S/Fe3+ ferrozine assay (measured at 562 nm )
hold on
plot(SFe_1_times, SFe_1_absorbance','ko-','Linewidth',2);
plot(SFe_2_times, SFe_2_absorbance','ko:','Linewidth',2);
plot(SFe_3_times, SFe_3_absorbance','ko-.','Linewidth',2);
legend('S^0/Fe^{3+} Bottle #1','S^0/Fe^{3+} Bottle #2','S^0/Fe^{3+} Bottle #3');
xlabel('Time Elapsed (hours)'),ylabel('Absorbance at 562 nm')

figure(2) % H2/Fe3+ ferrozine assay (measured at 562 nm)
hold on
plot(H2Fe_1_times, H2Fe_1_absorbance','ko-','Linewidth',2);
plot(H2Fe_2_times, H2Fe_2_absorbance','ko:','Linewidth',2);
plot(H2Fe_3_times, H2Fe_3_absorbance','ko-.','Linewidth',2);
legend('H_2/Fe^{3+} Bottle #1','H_2/Fe^{3+} Bottle #2','H_2/Fe^{3+} Bottle #3');
xlabel('Time Elapsed (hours)'),ylabel('Absorbance at 562 nm')

figure(3) % H2/S (Cline) assay (measured at 670 nm)
hold on
plot(H2S_1_times, H2S_1_absorbance','ko-','Linewidth',2);
plot(H2S_2_times, H2S_2_absorbance','ko:','Linewidth',2);
plot(H2S_3_times, H2S_3_absorbance','ko-.','Linewidth',2);
legend('H_2/S^0 Bottle #1','H_2/S^0 Bottle #2','H_2/S^0 Bottle #3');
xlabel('Time Elapsed (hours)'),ylabel('Absorbance at 670 nm')
