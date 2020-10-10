function plot_summary_results() 
    %% Window size check
    files_names = ['chb01','chb03', 'chb05','chb08','chb19','chb20','chb24'];
    [T_SVM_Full,T_KNN_Full,T_LDR_Full] = extract_summary_results(files_names,4096,"all");
    [T_SVM,T_KNN,T_LDR] = extract_summary_results(files_names,256,"all");
    acc = [T_SVM_Full.Accuracy;T_SVM.Accuracy];
    pre = [T_SVM_Full.Precision;T_SVM.Precision];
    rec = [T_SVM_Full.Recall;T_SVM.Recall];
    labels = [T_SVM_Full.Patient + " 4096";T_SVM.Patient+ " 256"];
    figure();
    subplot(3,1,1);
    bar([acc,pre,rec])
    xline(7.5,'--r');
    title('SVM Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall')
    acc = [T_KNN_Full.Accuracy;T_KNN.Accuracy];
    pre = [T_KNN_Full.Precision;T_KNN.Precision];
    rec = [T_KNN_Full.Recall;T_KNN.Recall];
    subplot(3,1,2);
    bar([acc,pre,rec])
    xline(7.5,'--r');
    title('KNN Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall');
    acc = [T_LDR_Full.Accuracy;T_LDR.Accuracy];
    pre = [T_LDR_Full.Precision;T_LDR.Precision];
    rec = [T_LDR_Full.Recall;T_LDR.Recall];
    subplot(3,1,3);
    bar([acc,pre,rec])
    xline(7.5,'--r');
    title('LDR Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall')
    sgtitle({'Window size resulr',sprintf('%s Not Full scalp respond',pad('Full scalp respond',40))})

    
	%% patient type check
    files_names = ['chb01','chb03', 'chb05','chb08','chb19','chb20','chb24'];
    [T_SVM_Full,T_KNN_Full,T_LDR_Full] = extract_summary_results(files_names,4096,"all");
    files_names = ['chb04','chb07', 'chb10','chb14','chb17','chb22','chb23'];
    [T_SVM,T_KNN,T_LDR] = extract_summary_results(files_names,4096,"all");
    acc = [T_SVM_Full.Accuracy;T_SVM.Accuracy];
    pre = [T_SVM_Full.Precision;T_SVM.Precision];
    rec = [T_SVM_Full.Recall;T_SVM.Recall];
    labels = [T_SVM_Full.Patient ;T_SVM.Patient];
    figure();
    subplot(4,1,1);
    bar([acc,pre,rec])
    xline(7.5,'--r');
    title('SVM Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside')
    acc = [T_KNN_Full.Accuracy;T_KNN.Accuracy];
    pre = [T_KNN_Full.Precision;T_KNN.Precision];
    rec = [T_KNN_Full.Recall;T_KNN.Recall];
    subplot(4,1,2);
    bar([acc,pre,rec])
    xline(7.5,'--r');
    title('KNN Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside');
    acc = [T_LDR_Full.Accuracy;T_LDR.Accuracy];
    pre = [T_LDR_Full.Precision;T_LDR.Precision];
    rec = [T_LDR_Full.Recall;T_LDR.Recall];
    subplot(4,1,3);
    bar([acc,pre,rec])
    xline(7.5,'--r');
    title('LDA Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside')
    sgtitle({'Compare epilepsy type result',sprintf('%s Not Full scalp respond',pad('Full scalp respond',40))})
    delay_SVM = [T_SVM_Full.delay;T_SVM.delay];
    delay_KNN = [T_KNN_Full.delay;T_KNN.delay];
    delay_LDR = [T_LDR_Full.delay;T_LDR.delay];
    subplot(4,1,4);
    bar([delay_SVM-1 delay_KNN-1 delay_LDR-1])
    legend('SVM classifier','KNN classifier','LDA classifier','Location','NorthEastOutside')
    title("window delay defore detection")
    ylim([-1,3])
    xticklabels(labels)
    yticks(-1:3)
    yticklabels(["Fail","Zero Delay","1","2","3"])
    
    %% Chnnels check
    files_names = ['chb01','chb03', 'chb05','chb08','chb19','chb20','chb24'];
    [T_SVM_Full,T_KNN_Full,T_LDR_Full] = extract_summary_results(files_names,4096,"all");
    [T_SVM,T_KNN,T_LDR] = extract_summary_results(files_names,4096,"low");
    acc = [];
    pre = [];
    rec = [];
    labels = [];
    for i =1:height(T_SVM)
        acc = [acc;T_SVM_Full.Accuracy(i)];
        acc = [acc;T_SVM.Accuracy(i)];
        pre = [pre;T_SVM_Full.Precision(i)];
        pre = [pre;T_SVM.Precision(i)];
        rec = [rec;T_SVM_Full.Recall(i)];
        rec = [rec;T_SVM.Recall(i)];
        labels = [labels T_SVM_Full.Patient(i) + " All"];
        labels = [labels T_SVM.Patient(i) + " Small"]; %  + "all channels"  + "4 channels"];
    end
    figure();
    subplot(4,1,1);
    bar([acc,pre,rec])
    line_vec = 2.5:2:12.5;
    for i = 1:length(line_vec)
        xline(line_vec(i),'--r');
    end
    title('SVM Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside')
    acc = [];
    pre = [];
    rec = [];
    for i =1:height(T_KNN)
        acc = [acc;T_KNN_Full.Accuracy(i)];
        acc = [acc;T_KNN.Accuracy(i)];
        pre = [pre;T_KNN_Full.Precision(i)];
        pre = [pre;T_KNN.Precision(i)];
        rec = [rec;T_KNN_Full.Recall(i)];
        rec = [rec;T_KNN.Recall(i)];
    end
    subplot(4,1,2);
    bar([acc,pre,rec])
    for i = 1:length(line_vec)
        xline(line_vec(i),'--r');
    end
    title('KNN Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside');
    acc = [];
    pre = [];
    rec = [];
    for i =1:height(T_LDR)
        acc = [acc;T_LDR_Full.Accuracy(i)];
        acc = [acc;T_LDR.Accuracy(i)];
        pre = [pre;T_LDR_Full.Precision(i)];
        pre = [pre;T_LDR.Precision(i)];
        rec = [rec;T_LDR_Full.Recall(i)];
        rec = [rec;T_LDR.Recall(i)];
    end
    subplot(4,1,3);
    bar([acc,pre,rec])
    for i = 1:length(line_vec)
        xline(line_vec(i),'--r');
    end
    title('LDA Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside')
    sgtitle('Compare channels number result')
    delay_SVM = [];    
    delay_KNN = [];
    delay_LDR = [];
    for i = 1:7
        delay_SVM = [delay_SVM;T_SVM_Full.delay(i)];
        delay_SVM = [delay_SVM;T_SVM.delay(i)];
        delay_KNN = [delay_KNN;T_KNN_Full.delay(i)];
        delay_KNN = [delay_KNN;T_KNN.delay(i)];
        delay_LDR = [delay_LDR;T_LDR_Full.delay(i)];
        delay_LDR = [delay_LDR;T_LDR.delay(i)];
    end
    subplot(4,1,4);
    bar([delay_SVM-1 delay_KNN-1 delay_LDR-1])
    title("window delay defore detection");
    for i = 1:length(line_vec)
        xline(line_vec(i),'--r');
    end
    ylim([-1,3])
    xticklabels(labels);
    legend('SVM classifier','KNN classifier','LDA classifier','Location','NorthEastOutside');
    yticks(-1:3)
    yticklabels(["Fail","Zero Delay","1","2","3"])
    %% Window check
    files_names = ['chb01','chb03', 'chb05','chb08','chb19','chb20','chb24'];
    [T_SVM_Full,T_KNN_Full,T_LDR_Full] = extract_summary_results(files_names,4096,"all");
    [T_SVM,T_KNN,T_LDR] = extract_summary_results(files_names,256,"all");
    acc = [];
    pre = [];
    rec = [];
    labels = [];
    for i =1:height(T_SVM)
        acc = [acc;T_SVM_Full.Accuracy(i)];
        acc = [acc;T_SVM.Accuracy(i)];
        pre = [pre;T_SVM_Full.Precision(i)];
        pre = [pre;T_SVM.Precision(i)];
        rec = [rec;T_SVM_Full.Recall(i)];
        rec = [rec;T_SVM.Recall(i)];
        labels = [labels T_SVM_Full.Patient(i) + " 4096"];
        labels = [labels T_SVM.Patient(i) + " 256"]; %  + "all channels"  + "4 channels"];
    end
    figure();
    subplot(4,1,1);
    bar([acc,pre,rec])
    line_vec = 2.5:2:12.5;
    for i = 1:length(line_vec)
        xline(line_vec(i),'--r');
    end
    title('SVM Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside')
    acc = [];
    pre = [];
    rec = [];
    for i =1:height(T_KNN)
        acc = [acc;T_KNN_Full.Accuracy(i)];
        acc = [acc;T_KNN.Accuracy(i)];
        pre = [pre;T_KNN_Full.Precision(i)];
        pre = [pre;T_KNN.Precision(i)];
        rec = [rec;T_KNN_Full.Recall(i)];
        rec = [rec;T_KNN.Recall(i)];
    end
    subplot(4,1,2);
    bar([acc,pre,rec])
    for i = 1:length(line_vec)
        xline(line_vec(i),'--r');
    end
    title('KNN Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside');
    acc = [];
    pre = [];
    rec = [];
    for i =1:height(T_LDR)
        acc = [acc;T_LDR_Full.Accuracy(i)];
        acc = [acc;T_LDR.Accuracy(i)];
        pre = [pre;T_LDR_Full.Precision(i)];
        pre = [pre;T_LDR.Precision(i)];
        rec = [rec;T_LDR_Full.Recall(i)];
        rec = [rec;T_LDR.Recall(i)];
    end
    subplot(4,1,3);
    bar([acc,pre,rec])
    for i = 1:length(line_vec)
        xline(line_vec(i),'--r');
    end
    title('LDA Classifier')
    xticklabels(labels)
    legend('Accuracy','Precision','Recall','Location','NorthEastOutside')
    sgtitle('Compare channels number result')
    delay_SVM = [];    
    delay_KNN = [];
    delay_LDR = [];
    for i = 1:7
        delay_SVM = [delay_SVM;(T_SVM_Full.delay(i)-1)*16];
        delay_SVM = [delay_SVM;T_SVM.delay(i)-1];
        delay_KNN = [delay_KNN;(T_KNN_Full.delay(i)-1)*16];
        delay_KNN = [delay_KNN;T_KNN.delay(i)-1];
        delay_LDR = [delay_LDR;(T_LDR_Full.delay(i)-1)*16];
        delay_LDR = [delay_LDR;T_LDR.delay(i)-1];
    end
    subplot(4,1,4);
    delay_SVM(delay_SVM<0) = -5;
    delay_KNN(delay_KNN<0) = -5;
    delay_LDR(delay_LDR<0) = -5;
    bar([delay_SVM delay_KNN delay_LDR])
    title("window delay defore detection");
    for i = 1:length(line_vec)
        xline(line_vec(i),'--r');
    end
    %ylim([-1,3])
    xticklabels(labels);
    legend('SVM classifier','KNN classifier','LDA classifier','Location','NorthEastOutside');
    %yticks(-1:3)
    %yticklabels(["Fail","Zero Delay","1","2","3"])
end