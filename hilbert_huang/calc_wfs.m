
function [dataset] = calc_wfs(dataset,imf_num)
    for i=1:length(dataset)
       dataset(i).wf = calc_wf(dataset(i).signal(2,:),imf_num);
    end
end