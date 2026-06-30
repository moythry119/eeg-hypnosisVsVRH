function plotmeangraph(listname,bandidx,varargin)
%% function to run :-  plotmeangraph('All_Subject_UWS_WithWithoutLoc_mohawk',3)
                     % plotmeangraph('All_Subject_mohawk',3)
                     % plotmeangraph('All_GermanyData',2)
loadpaths

%%
param = finputcheck(varargin, {
    'group', 'string', [], 'crsdiag'; ...
    'groupnames', 'cell', {}, {'EO','HYP','VHR','EMCS','LIS','CTR'}; ...
    });

%load(sprintf('%s/groupdata_%s.mat',filepath,listname));
filepath1 = 'C:\Users\moyth\Documents\ML_biowin';  % change the path wher your group data is there (i.e groupdata_All_GermanyData.mat)
load(sprintf('%s/groupdata_%s.mat',filepath1,listname));
load sortedlocs_127

groupvar = grp;
groups = unique(groupvar(~isnan(groupvar)));
%%
bands = {
    'delta'
    'theta'
    'alpha'
    'beta'
    'gamma'
    };

plotqt = 0.7; %0.6 %plotqt = 0.7 (originally .7)

for g = 1:length(groups)
    groupcoh(g,:,:) = squeeze(mean(allcoh(groupvar == groups(g),bandidx,:,:),1));
%         groupcoh(g,:,:) = squeeze(mean(allcoh(strcmp(groups{g},subjlist(:,1)),bandidx,:,:),1));
    threshcoh(g,:,:) = threshold_proportional(squeeze(groupcoh(g,:,:)),1-plotqt);
    for c = 1:size(threshcoh,2)
        groupdeg(g,c) = sum(threshcoh(g,c,:))/(size(threshcoh,2)-1);
    end
end

% erange = [min(nonzeros(threshcoh(:))) max(threshcoh(:))];
% vrange = [min(nonzeros(groupdeg(:))) max(groupdeg(:))];
erange = [0 0.5]; % 0.45] %%% 0.49]; erange = [0 1]; 47
vrange = [0 0.5]; % 0.45] %%% 0.5]; vrange = [0 0.4]; 47

for g = size(groupcoh,1):-1:1
    minfo(g,:) = plotgraph3d(squeeze(groupcoh(g,:,:)),'plotqt',plotqt,...
        'escale',erange,'vscale',vrange,'arcs','strength'); % 'module' / 'strength'
     
    camva(8);
    camtarget([-9.7975  -28.8277   41.8981]);
    campos([-1.7547    1.7161    1.4666]*1000);
    camzoom(1.25);
    fprintf('%s %s - number of modules: %d\n',param.groupnames{g},bands{bandidx},length(unique(minfo(g,:))));
    set(gcf,'Name',sprintf('%s %s',param.groupnames{g},bands{bandidx}));
    set(gcf,'InvertHardCopy','off');
    print(gcf,sprintf('%s/figures/meangraph_%s_%s.tif',filepath1,param.groupnames{g},bands{bandidx}),'-dtiff','-r150');
    %     saveas(gcf,sprintf('figures/meangraph_%s_%s.fig',grouplist{g},bands{bandidx}));
    close(gcf);
end