%% Step 1 Preparation
% Run this section, copy your data into Data (signal x trial), 
% and copy timepoint into TP. The length of TP should be the same as size(Data,1)
clear
clc
Data=[];
TP=[];
%% Step 2 Extract ROI values
Range=inputdlg({'From';'To'},'Range');
MeanValue=mean(Data(TP>=str2double(Range{1}) & TP <=str2double(Range{2}),:));
AreaValue=sum(Data(TP>=str2double(Range{1}) & TP <=str2double(Range{2}),:));
PeakValue=max(Data(TP>=str2double(Range{1}) & TP <=str2double(Range{2}),:));
figure
imagesc(TP,1:size(Data,2),Data')
colorbar
colormap jet
caxis([-10 10])