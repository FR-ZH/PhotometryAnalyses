%% Read Fils
clc
clear
[files,path]=uigetfile('*.*');
OData =  csvread([path,files],2,0);
cd(path)
BMs=[];
disp(['Finished loading: ',files]);
%% Epoch
clc
[sel]=listdlg('ListString',{'-5s ~ 5s','-5s ~ 10s','-5s ~ 20s','-5s ~ 60s',' Input '},...
    'Name','Choose the range','OKString','OK','CancelString','Cancel','SelectionMode','single','ListSize',[180 80]);
EData=[];
    switch sel
        case 1
            Duration = 5;
        case 2
            Duration = 10;
        case 3
            Duration = 20;
        case 4
            Duration = 60;
        case 5
            Duration = inputdlg({'Duration'},'Input Parameters',[1 40],{'100'});
            Duration=str2num(Duration{1});
    end
for t=1:size(BMs,1)
    Index = OData(:,1)>BMs(t,1)-5 & OData(:,1)<BMs(t,1)+Duration;
    TData=OData(Index,2);
    TData=TData(1:10:end);
    EData(t,:)=TData(2:(Duration+5)*100+1);
    clear Index TData
end
TimePoint=[-4.99:0.01:Duration];
%% Baseline Correction
CData=[]; 
CData= (EData-repmat(median(EData(:,280:400),2),[1,size(EData,2)]));
% Plot
figure
subplot(2,1,1)
imagesc(TimePoint,1:size(CData,1),CData)
xlim([-5 Duration])
yticks(1:1:size(BMs,1))
colormap jet
colorbar
caxis([-5 5])
subplot(2,1,2)
plot(TimePoint,mean(CData,1))
xlim([-5 Duration])
clc