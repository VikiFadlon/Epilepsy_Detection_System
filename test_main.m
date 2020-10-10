%% window size test
clear all;close all; clc
patient = "chb01";
window_sizes = [256,512,1024,2048,4096]; % 256 HZ
channels = "FP2-F8";
test_num = length(window_sizes);
%
Results = array2table(zeros(test_num,1),'VariableNames',{'Window_size'});
for i = 1:test_num
    [svm_result,knn_result,ldr_result, seizures] = EEG_Profile(patient,channels,window_sizes(i));
    Results.Patient(i) = patient;
    Results.Channel(i) = channels;
    Results.Window_size(i) = window_sizes(i);
    Results.SVM(i) = {svm_result};
    Results.KNN(i) = {knn_result};
    Results.LDR(i) = {ldr_result};
    Results.Seizures(i) = {seizures};
    save ('window_test.mat','Results');
end

%% Analyze Results - Window test
load('window_test.mat')
len = height(Results);
plot_FN = zeros(len,3);
plot_FP = zeros(len,3);
for i = 1:len
    seizures = cell2mat(Results.Seizures(i));
    svm = cell2mat(Results.SVM(i));
    knn = cell2mat(Results.KNN(i));
    ldr = cell2mat(Results.LDR(i));
    svm_accuracy = sum(seizures(svm==0)==1)/sum(seizures==1);
    knn_accuracy = sum(seizures(knn==0)==1)/sum(seizures==1);
    ldr_accuracy = sum(seizures(ldr==0)==1)/sum(seizures==1);
    plot_FN(i,:) = [svm_accuracy knn_accuracy ldr_accuracy];
    svm_accuracy = sum(seizures(svm==1)==0)/sum(seizures==0);
    knn_accuracy = sum(seizures(knn==1)==0)/sum(seizures==0);
    ldr_accuracy = sum(seizures(ldr==1)==0)/sum(seizures==0);
    plot_FP(i,:) = [svm_accuracy knn_accuracy ldr_accuracy];
end
figure()
subplot(1,2,1)
bar(plot_FN)
legend({'SVM','KNN = 1','LDR'})
title("False Negative") 
set(gca,'xticklabel',{'256 (1 sec)','512 (2 sec)','1024 (4 sec)','2048 (8 sec)','4096 (16 sec)'})
xlabel('window size (samples)')
ylabel('False Negative')

subplot(1,2,2)
bar(plot_FP)
legend({'SVM','KNN = 1','LDR'})
title("False Positive") 
set(gca,'xticklabel',{'256 (1 sec)','512 (2 sec)','1024 (4 sec)','2048 (8 sec)','4096 (16 sec)'})
xlabel('window size (samples)')
ylabel('False Positive')
sgtitle("Window test")

%% channels test
clear all;close all; clc
patient = "chb01";
window_sizes = 4096; 
channels = ["FP2-F8","FP1-F7","F7-T7","F8-T8"];
test_num = length(channels);
%
ch = [];
Results = array2table(zeros(test_num,1),'VariableNames',{'Window_size'});
for i = 1:test_num
    ch = [ch channels(i)];
    [svm_result,knn_result,ldr_result, seizures] = EEG_Profile(patient,ch,window_sizes);
    Results.Patient(i) = patient;
    Results.Channel(i) = {ch};
    Results.Window_size(i) = window_sizes;
    Results.SVM(i) = {svm_result};
    Results.KNN(i) = {knn_result};
    Results.LDR(i) = {ldr_result};
    Results.Seizures(i) = {seizures};
    save ('channel_test.mat','Results');
end
%% Analyze Results - channels test
load('channel_test.mat')
len = height(Results);
plot_FN = zeros(len,3);
plot_FP = zeros(len,3);
for i = 1:height(Results)
    seizures = cell2mat(Results.Seizures(i));
    svm = cell2mat(Results.SVM(i));
    knn = cell2mat(Results.KNN(i));
    ldr = cell2mat(Results.LDR(i));
    svm_accuracy = sum(seizures(svm==0)==1)/sum(seizures==1);
    knn_accuracy = sum(seizures(knn==0)==1)/sum(seizures==1);
    ldr_accuracy = sum(seizures(ldr==0)==1)/sum(seizures==1);
    plot_FN(i,:) = [svm_accuracy knn_accuracy ldr_accuracy];
    svm_accuracy = sum(seizures(svm==1)==0)/sum(seizures==0);
    knn_accuracy = sum(seizures(knn==1)==0)/sum(seizures==0);
    ldr_accuracy = sum(seizures(ldr==1)==0)/sum(seizures==0);
    plot_FP(i,:) = [svm_accuracy knn_accuracy ldr_accuracy];
end
figure()
subplot(1,2,1)
bar(plot_FN)
legend({'SVM','KNN = 1','LDR'})
title("False Negative") 
xlabel('Num of Channels')
ylabel('False Negative')

subplot(1,2,2)
bar(plot_FP)
legend({'SVM','KNN = 1','LDR'})
title("False Positive") 
xlabel('Num of Channels')
ylabel('False Positive')
sgtitle("Channels test")