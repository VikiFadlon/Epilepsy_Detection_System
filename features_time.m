



function [energy,apen] = features_time(signal,signal_len,window_size)
    energy = [];
    apen = [];
    for i = 1:floor(signal_len/window_size)
       current_window = signal((i-1)*window_size + 1:i*window_size);
       current_energy = sum(current_window.^2);
       current_apen = ApEn(2,0.8,current_window,1); 
       apen = [apen current_apen*ones(1,window_size)];
       energy = [energy current_energy*ones(1,window_size)]; 
    end
    if (floor(signal_len/window_size)*window_size) ~= signal_len
       window_size = signal_len - (floor(signal_len/window_size)*window_size);
       current_window = signal(end-window_size:end);
       current_energy = sum(current_window.^2);
       current_apen = ApEn(2,0.8,current_window,1); 
       apen = [apen current_apen*ones(1,window_size)];
       energy = [energy current_energy*ones(1,window_size)]; 
    end
end