
function [EEG_filter] = filter_EEG_signals(EEG)
    filters_names = dir2('filters');
    for i=1:length(EEG)
        srate = EEG(i).data.srate;
        samples = EEG(i).data.samples;
        t = 0:1/srate:samples/srate-1/srate;
        disp("filter file " + EEG(i).file_name)
        for f = 1:length(filters_names)
            [~,name,~] = fileparts(filters_names(f).name);
            filter_name = eval(name);
            delay = mean(grpdelay(filter_name));
            data_z = zeros(EEG(i).data.ch_num,samples-delay);
                for k=1:EEG(i).data.ch_num            
                    signal = EEG(i).data.signals(k,:);
                    fsignal = filter(filter_name,signal);
                    nfsignal = fsignal;
                    nfsignal(1:delay) = [];
                    data_z(k,:) = nfsignal;
                end
            data(f).filter_name = filters_names(f).name;
            data(f).signals = data_z;
            data(f).ch = EEG(i).data.ch;
            data(f).ch_num = EEG(i).data.ch_num;
            data(f).samples = EEG(i).data.samples - delay;
            data(f).srate = EEG(i).data.srate;
        end
        EEG_filter(i).file_name = EEG(i).file_name;
        EEG_filter(i).data = data;
        EEG_filter(i).seizures = EEG(i).seizures;
     end
    
end
