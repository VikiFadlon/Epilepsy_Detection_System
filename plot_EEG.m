

function plot_EEG(EEG,file_name,index,winsize)
    for file=1:length(EEG)
        if EEG(file).file_name == file_name
            break
        end
    end
    signal = EEG(file).data.signals(index,:);
    srate = EEG(file).data.srate;
    samples = EEG(file).data.samples;
    start_seizu = EEG(file).seizures.start_seizures;
    end_seizu = EEG(file).seizures.end_seizures;
    if isnan(start_seizu) || isnan(end_seizu)
        disp("file dont have seizures")
        return
    end
    sstart = start_seizu * srate;
    end_seizu = end_seizu * srate; 
    tseizure = [];
    tseizure = [tseizure zeros(1,sstart)];
    tseizure = [tseizure ones(1,end_seizu - sstart)];
    tseizure = [tseizure zeros(1,samples - end_seizu)];
    t = 0:1/srate:samples/srate -1/srate;
    % features in time 
    figure()
    [energy,apen] = features_time(signal,samples,winsize);
    hold on
    plot(t,signal/max(signal))
    plot(t,energy/max(energy),'LineWidth',2)
    plot(t,apen/max(apen),'LineWidth',2)
    plot(t,tseizure)
    legend('signal','energy','aprox entropy','seizure')
    xlim([0 3600])
    ylim([-1.5 1.5])
    hold off
end
