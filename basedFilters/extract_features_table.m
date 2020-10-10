
function [ch_1_table,ch_2_table] = extract_features_table(dataset)
    ch_1_table = [];
    ch_2_table = [];
    for i=1:length(dataset)
        disp("extract features from "+ dataset(i).type +" file " + dataset(i).file_name) 
        ch_1 = extract_features(dataset(i).signal(1,:),dataset(i).type);
        ch_2 = extract_features(dataset(i).signal(2,:),dataset(i).type);
        ch_1_table = [ch_1_table ; ch_1];
        ch_2_table = [ch_2_table ; ch_2];
    end
    disp("finish filter dataset");
end
