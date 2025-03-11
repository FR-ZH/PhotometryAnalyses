%% Step 1 run this section and copy data into Data
clear
clc
Data=[];
%% Step 2 select SR
SR=inputdlg('1000 or 100 ?','Input SR');
SR=str2double(SR{1});
%% Step 3 analyze data 
Range=inputdlg({'From';'To'},'Range');
MeanValue=mean(Data((5+str2double(Range{1}))*SR:(5+str2double(Range{2}))*SR,:));
AreaValue=sum(Data((5+str2double(Range{1}))*SR:(5+str2double(Range{2}))*SR,:));
PeakValue=max(Data((5+str2double(Range{1}))*SR:(5+str2double(Range{2}))*SR,:));
imagesc(Data')
colorbar
colormap jet
caxis([-10 10])