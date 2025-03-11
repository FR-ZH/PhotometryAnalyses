WorkData=L_PVN_Ca; %Change here, Signal x Trials

for TrialN= 1:size(WorkData,2) % change here
    [pks,locs,w,p]=findpeaks(smooth(WorkData(:,TrialN),20),'Annotate','extents'); % change here
    figure
    findpeaks(smooth(WorkData(:,TrialN),20),'Annotate','extents'); % Change here, 20 is the threshold for peak detection
    title(['Trial:',num2str(TrialN)])
    
    DNP.w = w>=50;
    DNP.locs = locs>=400 & locs<=BeL(TrialN)*100+500;
    for i = 1:length(pks)
        DNP.Ca(i,1) = DNP.w(i)==1 & DNP.locs(i) ==1;
    end
    
    eval(['RP.Trial',num2str(TrialN),'.locs=locs(DNP.Ca);']);
    eval(['RP.Trial',num2str(TrialN),'.w=w(DNP.Ca);']);
    eval(['RP.Trial',num2str(TrialN),'.p=p(DNP.Ca);']);
    eval(['RP.Trial',num2str(TrialN),'.pks=pks(DNP.Ca);']);
    eval(['[~,Index]=max(RP.Trial',num2str(TrialN),'.p);']);
    
    eval(['FP(TrialN).locs=RP.Trial',num2str(TrialN),'.locs(Index)/100-5;']);
    eval(['FP(TrialN).pks=RP.Trial',num2str(TrialN),'.pks(Index);']);
    eval(['FP(TrialN).w=RP.Trial',num2str(TrialN),'.w(Index)/100;']);
    eval(['FP(TrialN).p=RP.Trial',num2str(TrialN),'.p(Index);']);
    
    hold on
    stem(FP(TrialN).locs*100+500,FP(TrialN).pks,'filled','MarkerFaceColor','magenta');
    pause(1)
    clear i pks locs w p DNP Index
    close all
end