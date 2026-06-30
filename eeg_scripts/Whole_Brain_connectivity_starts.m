% Starts sor whole brain connectivity 
clc
close all
allcoh=allcoh; %main 4d connectivity matrix,i.e.: Subject x band x wPLI (198x5x127x127)
allcoh_wb=mean(mean(allcoh,4),3);
%% Starts 
clc
group_no= repmat([1 2 3], 1, size(allcoh_wb,1));
group_no= repmat([1 2 3], 1, size(allcoh_wb,1)/3);
idx_eo=find(group_no==1);
idx_hyp=find(group_no==2);
idx_vrh=find(group_no==3);

allcoh_wb_eo=allcoh_wb(idx_eo,:);
allcoh_wb_hyp=allcoh_wb(idx_hyp,:);
allcoh_wb_vrh=allcoh_wb(idx_vrh,:);

allcoh_wb_eo_mean=mean(allcoh_wb_eo)
allcoh_wb_eo_sd=std(allcoh_wb_eo)

allcoh_wb_hyp_mean=mean(allcoh_wb_hyp)
allcoh_wb_hyp_sd=std(allcoh_wb_hyp)

allcoh_wb_vrh_mean=mean(allcoh_wb_vrh)
allcoh_wb_vrh_sd=std(allcoh_wb_vrh)

% paired t-test to look betwwen condition different (note there is 5 bands
% with the order of: delta, theta, alpha, beta, gama)

[h_eo_vs_hip, p_eo_vs_hip,~, s_eo_vs_hip] = ttest(allcoh_wb_eo,allcoh_wb_hyp,'Alpha', 0.01)

[h_eo_vs_vrh, p_eo_vs_vrh,~, s_eo_vs_vrh] = ttest(allcoh_wb_eo,allcoh_wb_vrh, 'Alpha', 0.01)

[h_hip_vs_vrh, p_hip_vs_vrh,~, s_hip_vs_vrh] = ttest(allcoh_wb_hyp,allcoh_wb_vrh, 'Alpha', 0.01)




%% Starts sor whole powerspectral 
clc
close all
bandpower=bandpower; %3d connectivity matrix,i.e.: Subject x band x channel (198x5x127)
bandpower_wb=mean(bandpower,3);
%%% Starts 
clc
group_no= repmat([1 2 3], 1, size(bandpower_wb,1));
group_no= repmat([1 2 3], 1, size(bandpower_wb,1)/3);
idx_eo=find(group_no==1);
idx_hyp=find(group_no==2);
idx_vrh=find(group_no==3);

bandpower_wb_eo=bandpower_wb(idx_eo,:);
bandpower_wb_hyp=bandpower_wb(idx_hyp,:);
bandpower_wb_vrh=bandpower_wb(idx_vrh,:);

bandpower_wb_eo_mean=mean(bandpower_wb_eo)
bandpower_wb_eo_sd=std(bandpower_wb_eo)

bandpower_wb_hyp_mean=mean(bandpower_wb_hyp)
bandpower_wb_hyp_sd=std(bandpower_wb_hyp)

bandpower_wb_vrh_mean=mean(bandpower_wb_vrh)
bandpower_wb_vrh_sd=std(bandpower_wb_vrh)

% paired t-test to look betwwen condition different (note there is 5 bands
% with the order of: delta, theta, alpha, beta, gama)

[h_eo_vs_hip, p_eo_vs_hip,~, s_eo_vs_hip] = ttest(bandpower_wb_eo,bandpower_wb_hyp, 'Alpha', 0.01)

[h_eo_vs_vrh, p_eo_vs_vrh,~, s_eo_vs_vrh] = ttest(bandpower_wb_eo,bandpower_wb_vrh,  'Alpha', 0.01)

[h_hip_vs_vrh, p_hip_vs_vrh,~, s_hip_vs_vrh] = ttest(bandpower_wb_hyp,bandpower_wb_vrh, 'Alpha', 0.01)
