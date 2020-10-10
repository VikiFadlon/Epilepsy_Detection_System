
function [T] = extract_features(signal,type)
    filters_names = dir2('filters');
    entrop = ApEn(2,0.8,signal,1);
    energy = zeros(1,length(filters_names));
    for f = 1:length(filters_names)
        [~,name,~] = fileparts(filters_names(f).name);
        filter_name = eval(name);
        fsignal = filter(filter_name,signal);
        fsignal(1:mean(grpdelay(filter_name))) = [];
        energy(:,f) = mean(abs(fsignal).^2);
    end
    T = table(type,entrop,energy(:,1),energy(:,2),energy(:,3),'VariableNames',{'Seizure','Entropy','Energy alpha','Energy delta','Energy theta'});   
end
