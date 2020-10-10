
function test_accurecy(EEG,window_size,wf_mean,imf_num)
    for i=1:length(EEG)
        signal = EEG(i).data.signals(2,:);
        srate = EEG(i).data.srate;
        start_seizure = EEG(i).seizures.start_seizures*srate;
        end_seizure = EEG(i).seizures.end_seizures*srate;
        error = 0;
        known = [];
        predict = [];
        result_line = [];
        tseizure = [];
        arr = ["non_seizure","seizure"];
        for k=1:floor(EEG(i).data.samples/window_size)
            start = 1+(k-1)*window_size;
            if sum(start_seizure<start) - sum(end_seizure<start) == 0
                known = [known "non_seizure"];
            else
                known = [known "seizure"];
            end
            chunk = signal(start:k*window_size);
            wf = calc_wf(chunk,imf_num);
            scoure = [];
            scoure = [scoure sum((wf_mean(2,:)- wf').^2)];
            scoure = [scoure sum((wf_mean(1,:)- wf').^2)];
            [~,result] = min(scoure);
            result_line = [result_line ones(1,window_size)*result];
            predict = [predict arr(result)];
        end
        srate = EEG(i).data.srate;
        samples = EEG(i).data.samples ;
        sstart = EEG(i).seizures.start_seizures*srate;
        send = EEG(i).seizures.end_seizures*srate;
        tseizure = [tseizure zeros(1,sstart)];
        tseizure = [tseizure ones(1,send-sstart)];
        tseizure = [tseizure zeros(1,samples - send)];
        t = 0:1/srate:samples/srate -1/srate;
        figure()
        hold on
        plot(t,signal/max(signal))
        plot(t,tseizure,'LineWidth',2)
        plot(t,(result_line-1),'LineWidth',2)
        legend("signal","Known Seizures", "predict Seizures")
        xlim([0 3600])
        ylim([0 1.5])
        title("chb1 Record 1") 
        figure()
        confusionchart(known,predict)
    end
end
