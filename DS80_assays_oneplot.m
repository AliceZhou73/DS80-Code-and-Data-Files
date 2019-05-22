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

all_SFe_absorbance = [SFe_1_absorbance'; SFe_2_absorbance'; SFe_3_absorbance']; % matrix with rows = data for each sample
all_H2Fe_absorbance = [H2Fe_1_absorbance'; H2Fe_2_absorbance'; H2Fe_3_absorbance'];
all_H2S_absorbance = [H2S_1_absorbance'; H2S_2_absorbance'; H2S_3_absorbance'];
SFe_stderr = (std(all_SFe_absorbance))./(sqrt(3));
H2Fe_stderr = std(all_H2Fe_absorbance)./(sqrt(3));
H2S_stderr = std(all_H2S_absorbance)./(sqrt(3));


avg_SFe_absorbance = (SFe_1_absorbance + SFe_2_absorbance + SFe_3_absorbance)./3;
avg_H2Fe_absorbance = (H2Fe_1_absorbance + H2Fe_2_absorbance + H2Fe_3_absorbance)./3;
avg_H2S_absorbance = (H2S_1_absorbance + H2S_2_absorbance + H2S_3_absorbance)./3;

figure(1) % H2/S (Cline) assay (measured at 670 nm)
hold on
yyaxis left
errorbar(H2S_1_times, avg_H2S_absorbance',H2S_stderr,'ko-','Linewidth',2,'Markersize',10);


xlabel('Time Elapsed (hours)'),ylabel('Absorbance at 670 nm')


yyaxis right
% H2/Fe3+ ferrozine assay (measured at 562 nm)
errorbar(H2Fe_1_times, avg_H2Fe_absorbance',H2Fe_stderr,'bs-','Linewidth',2,'Markersize',10);
errorbar(SFe_1_times, avg_SFe_absorbance',SFe_stderr,'rv-','Linewidth',2,'Markersize',10);


legend('H_2/S^0 Average (670 nm)' ,...
    'H_2/Fe^{3+} Average (562 nm)',...
    'S^0/Fe^{3+} Average (562 nm)');
xlabel('Time Elapsed (hours)'),ylabel('Absorbance at 562 nm')

plt = gca;
plt.YAxis(1).Color = 'k';
plt.YAxis(2).Color = 'k';



