function ch_num_test
    folder_name = "results";
    path = pwd + "/" + folder_name;
    files = dir2(path);
    for i = 1:length(files) - 1
        load(folder_name + "/" + files(i).name)
        f = split(files(i).name,"_");
        data(i).name = cell2mat(f(1));
        data(i).window_size = cell2mat(f(2));
        type = split(cell2mat(f(3)),".");
        data(i).type = strcmp(cell2mat(type(1)),'15');
        data(i).SVM = [accuracy(1) precision(1) recall(1)];
        data(i).KNN = [accuracy(2) precision(2) recall(2)];
        data(i).LDR = [accuracy(3) precision(3) recall(3)];
    end
    for i = 1:2:length(data)
        figure()
        subplot(1,2,1)
        bar([data(i).SVM; data(i).KNN; data(i).LDR])
        xticklabels({'SVM','KNN','LDR'})
        legend("Accuracy", "Precision", "Recall")
        title("Low Channels")
        subplot(1,2,2)
        bar([data(i+1).SVM; data(i+1).KNN; data(i+1).LDR])
        xticklabels({'SVM','KNN','LDR'})
        legend("Accuracy", "Precision", "Recall")
        title("All Channels")
        sgtitle(data(i).name)
	end
end
