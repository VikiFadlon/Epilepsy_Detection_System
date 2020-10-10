



function [energy,apen,se_energy,se_apen] = features(signal,seizures,signal_len,window_size)
    energy = [];
    apen = [];
    se_energy = [];
    se_apen = [];
    for i = 1:floor(signal_len/window_size)
       start_current_window = (i-1)*window_size + 1;
       end_current_window = i*window_size;
       current_window = signal(start_current_window:end_current_window);
       current_energy = mean(abs(current_window).^2);
       current_apen = ApEn(2,0.4,current_window,1);
       if (seizures.start_time*256) <= start_current_window && start_current_window <= ((seizures.start_time + seizures.length+5)*256)
            se_apen = [se_apen current_apen];
            se_energy = [se_energy current_energy];  
       else
            apen = [apen current_apen];
            energy = [energy current_energy]; 
       end
    end
    if (floor(signal_len/window_size)*window_size) ~= signal_len
       window_size = signal_len - (floor(signal_len/window_size)*window_size);
       current_window = signal(end-window_size:end);
       current_energy = mean(abs(current_window).^2);
       current_apen = ApEn(2,0.4,current_window,1); 
       apen = [apen current_apen];
       energy = [energy current_energy]; 
    end
end