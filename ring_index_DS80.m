%% Relative amounts - DS80 batch data
clc;clear;close all
filename = 'DS80 GDGT Data' % enter path to file in single quotes
sheet = 1;
[numeric,text_only,all_data] = xlsread(filename,sheet,'','basic'); % loads data as cell array
all_data


data_no_headers = all_data;
headers = [1]; % enter row numbers of text headers in an array
data_no_headers(headers,:) = []; % removes rows with text headers

GDGT_start = 2; % enter column number where GDGT data starts (GDGT-0, usually)
GDGT_end = 8; % enter column number where GDGT data ends
all_GDGTs = data_no_headers(:,GDGT_start:GDGT_end) % returns GDGT data
all_GDGTs = cell2mat(all_GDGTs);
% Create normalized GDGT values
normalized_GDGTs = []; 

% For normalization loop, assumes data is set up like so:

%            GDGT0 GDGT1 GDGT2 GDGT3 ..... indexed by j
%   Sample 1
%   Sample 2
%   Sample 3
%   Sample 4
%      .
%      .
%      .
%   Sample(length_all_GDGTs)            
%      ^
%      indexed by i

for i = 1:length(all_GDGTs) % for all samples
    for j = 1:(GDGT_end - GDGT_start + 1); % for all GDGT species 
        normalized_GDGTs(i,j) = all_GDGTs(i,j)/(sum(all_GDGTs(i,:))) 
        % relative abundance of each GDGT species is the value divided by
        % the sum of all GDGTs for that particular sample (sum across the
        % row)
    end
end
normalized_GDGTs
if rem((normalized_GDGTs(randi(length(normalized_GDGTs)),:)),1) == 0
 % checks that remainder after sum of a random row divided by 1 is zero
    disp('CHECK NORMALIZATION SCRIPT -- PERCENTAGES DO NOT ADD TO 1.')
else
    disp('Normalization routine successful.')
end

axis square
c = categorical({'H_2/Fe^{3+} #1','H_2/Fe^{3+} #2','H_2/Fe^{3+} #3','S/Fe^{3+} #1','S/Fe^{3+} #2','S/Fe^{3+} #3',...
    'H_2/S #1','H_2/S #2','H_2/S #3'});
c = reordercats(c,{'H_2/S #1','H_2/S #2','H_2/S #3','S/Fe^{3+} #1','S/Fe^{3+} #2','S/Fe^{3+} #3',...
    'H_2/Fe^{3+} #1','H_2/Fe^{3+} #2','H_2/Fe^{3+} #3'});

bargraph = bar(c,normalized_GDGTs,'stacked');
size = size(all_GDGTs); size = size(2);

colors = jet(size); % jet(n) specifies n evenly-spaced colors from the jet colormap
for i = 1:7
    bargraph(i).FaceColor = colors(i,:);
end
ylim([0,1])
ylabel('Relative Abundance','Fontsize',14,'Fontname','Sans Serif');
ytickformat('%.1f')
legend('GDGT-0','GDGT-1','GDGT-2','GDGT-3','GDGT-4','GDGT-5','GDGT-6','Fontname','Sans Serif','Orientation','horizontal')


