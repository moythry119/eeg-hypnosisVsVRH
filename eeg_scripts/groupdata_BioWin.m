function groupdata
%%
filepath = 'C:\Users\moyth\Documents\ML_biowin\mat_signal_processing';  %% filepath = '/Users/chennu/Data/MOHAWK/';
cd (filepath)
% subjlist = {  
% };
%loadsubj
%loadsubj_UWS_MCSstar_MCS

loadsubj_BioWin
subjlist = allpat;
%listname = 'All_UWS_MCSstar_MCS';
%listname = 'All_UWS_MCSstar_MCS_mohawk_final1'
%listname = 'All_UWS_MCSstar_MCS_mohawk_final_mp'
listname = 'All_BioWin_mohawk'
savename = sprintf('%s/groupdata_%s.mat',filepath,listname);
filesuffix = '_mohawk';
%%
for s = 1:size(subjlist,1)
    basename = subjlist{s,1};
    grp(s) = subjlist{s,3,:}; %grp(s) = subjlist_group2{s,2,:};
    
    fprintf('Processing %s.\n',basename);
    loadname = sprintf('%s/%s%s%s.mat',filepath,basename,filesuffix);
    load(loadname);
    load(loadname,'freqs');
    
    if s == 1
        freqbins = freqs;
        allspec ='Not Featched from data';
  %%%      allspec = zeros(size(subjlist,1),length(chanlocs),length(freqs));
        bandpower = zeros(size(subjlist,1),size(matrix,1),length(chanlocs));
        allcoh = zeros(size(subjlist,1),size(matrix,1),length(chanlocs),length(chanlocs));
        graph = graphdata(:,1);
        for m = 1:size(graph,1)
            graph{m,2} = zeros([size(subjlist,1) size(graphdata{m,2})]);
        end
    end
    
    matrix(isnan(matrix)) = 0;
    matrix = abs(matrix);
    allcoh(s,:,:,:) = matrix;
    
      %%% allspec(s,:,:) = spectra;
    for f = 1:size(freqlist,1)
        [~, bstart] = min(abs(freqs-freqlist(f,1)));
        [~, bstop] = min(abs(freqs-freqlist(f,2)));
        [~,peakindex] = max(mean(spectra(:,bstart:bstop),1),[],2);
        bandpower(s,f,:) = spectra(:,bstart+peakindex-1);
    end
    
    for c = 1:size(bandpower,3)
        bandpower(s,:,c) = bandpower(s,:,c)./sum(bandpower(s,:,c));
    end
    
    for m = 1:size(graph,1)
        graph{m,2}(s,:) = graphdata{m,2}(:);
    end
end
%%
save(savename, 'grp', 'allspec', 'freqbins', 'bandpower', 'allcoh', 'subjlist', 'graph', 'tvals', 'subjlist');