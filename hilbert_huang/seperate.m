

function [train,test] = seperate(dataset)
    len = length(dataset);
    seizure = dataset(1:len/2);
    non_seizure = dataset((len/2+1):end);
    train = [seizure(1:length(seizure)/2) non_seizure(1:length(non_seizure)/2)];
    test = [seizure((length(seizure)/2+1):end) non_seizure((length(non_seizure)/2+1):end)];
end