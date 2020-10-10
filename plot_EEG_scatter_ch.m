

function plot_EEG_scatter_ch(EEG,ch_name)
    energy = [];
    apen = [];
    se_energy = [];
    se_apen = [];
    for i=1:length(EEG)
        disp("extract features from file " + EEG(i).file_name)
        start = EEG(i).seizures.start_time;
        size = EEG(i).seizures.length;
        if isnan(start) || isnan(size)
            disp("file dont have seizures")
        else
            samples = EEG(i).data.samples;       
            for k=1:EEG(i).data.ch_name
                if EEG(i).data.ch(k) == ch_name
                    signal = EEG(i).data.signals(k,:);
                    [current_energy,current_apen,current_se_energy,current_se_apen] = features(signal,EEG(i).seizures,samples,2560);
                    energy = [energy current_energy];
                    apen = [apen current_apen];
                    se_energy = [se_energy current_se_energy];
                    se_apen = [se_apen current_se_apen];
                    break
                end
            end
        end
    end
    % scatter plot
        hold on
        scatter(apen,energy)
        scatter(se_apen,se_energy)
        legend('normal','seizures');
        title(ch_name)
end
