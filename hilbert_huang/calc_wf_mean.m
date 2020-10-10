

function wf_mean = calc_wf_mean(train,imf_num)
    wf_mean = zeros(2,imf_num);
    wf_mean(1,:) = mean([train(1:length(train)/2).wf]');
    wf_mean(2,:) = mean([train((length(train)/2+1):end).wf]');
end