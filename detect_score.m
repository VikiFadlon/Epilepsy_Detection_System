function detect_score()
	folder_name = "results";
    files = dir2(folder_name);
    files(end) = [];
    file15 = [];
    SVM15 = [];
    KNN15 = [];
    LDR15 = [];
    filee = [];
    SVMe = [];
    KNNe = [];
    LDRe = [];
    SVMacce = [];
    SVMpree = [];
    SVMrece = [];
    KNNacce = [];
    KNNpree = [];
    KNNrece = [];
    LDRacce = [];
    LDRpree = [];
    LDRrece = [];
    SVMacc15 = [];
    SVMpre15 = [];
    SVMrec15 = [];
    KNNacc15 = [];
    KNNpre15 = [];
    KNNrec15 = [];
    LDRacc15 = [];
    LDRpre15 = [];
    LDRrec15 = [];
    names = ['chb01','chb03', 'chb05','chb08','chb19','chb20','chb24'];
    for f = 1:length(files)
        file_name = files(f).name;
        if contains(names, files(f).name(1:5))
            continue
        end
        load(folder_name + "/" + file_name)
        fprintf("%s result:\n",file_name)
        True_values = result(:,1);
        SVM = result(:,2);
        KNN = result(:,3);
        LDR = result(:,4);
        t = find(True_values==1);
        if isempty(t)
            fprintf("!!! file dont have Sezu\n")
            continue
        end
        num_of_seizures = sum(diff(t)>2) + 1;
        fprintf("num of Seizu = %d \n",num_of_seizures)
        if(num_of_seizures>1)
           fprintf("??? file have more Sezu\n")
            continue
        end 
        SVM_res = find(SVM(True_values==1)==1, 1 );
        KNN_res = find(KNN(True_values==1)==1, 1 );
        LDR_res = find(LDR(True_values==1)==1, 1 );
        if isempty(SVM_res)
            SVM_res = 0;
        end
        if isempty(KNN_res)
            KNN_res = 0;
        end
        if isempty(LDR_res)
            LDR_res = 0;
        end
        a = split(file_name,'_');
        num = split(a(3),'.');
        num = cell2mat(num(1));

        if strcmp(num,'15')
            file15 = [file15 f];
            SVM15 = [SVM15 SVM_res];
            KNN15 = [KNN15 KNN_res];
            LDR15 = [LDR15 LDR_res];
            SVMacc15 = [SVMacc15 accuracy(1)];
            SVMpre15 = [SVMpre15 precision(1)];
            SVMrec15 = [SVMrec15 recall(1)];
            KNNacc15 = [KNNacc15 accuracy(2)];
            KNNpre15 = [KNNpre15 precision(2)];
            KNNrec15 = [KNNrec15 recall(2)];
            LDRacc15 = [LDRacc15 accuracy(3)];
            LDRpre15 = [LDRpre15 precision(3)];
            LDRrec15 = [LDRrec15 recall(3)];
        else
            filee = [filee f];
            SVMe = [SVMe SVM_res];
            KNNe = [KNNe KNN_res];
            LDRe = [LDRe LDR_res];
            SVMacce = [SVMacce accuracy(1)];
            SVMpree = [SVMpree precision(1)];
            SVMrece = [SVMrece recall(1)];
            KNNacce = [KNNacce accuracy(2)];
            KNNpree = [KNNpree precision(2)];
            KNNrece = [KNNrece recall(2)];
            LDRacce = [LDRacce accuracy(3)];
            LDRpree = [LDRpree precision(3)];
            LDRrece = [LDRrece recall(3)];
        end
    end
    fprintf("SVM:\n")
    fprintf("ALL Channels Results\n")
    for i = 1:length(filee)
        fprintf("file: %s Acc = %d pre = %d rec= %d delay %d\n",files(filee(i)).name,SVMacce(i),SVMpree(i),SVMrece(i),SVMe(i))
    end 
	fprintf("Front Channels Results\n")
    for i = 1:length(file15)
        fprintf("file: %s Acc = %d pre = %d rec= %d delay %d\n",files(filee(i)).name,SVMacc15(i),SVMpre15(i),SVMrec15(i),SVM15(i))
    end
	fprintf("KNN:\n")
    fprintf("ALL Channels Results\n")
    for i = 1:length(filee)
        fprintf("file: %s Acc = %d pre = %d rec= %d delay %d\n",files(filee(i)).name,KNNacce(i),KNNpree(i),KNNrece(i),KNNe(i))
    end 
	fprintf("Front Channels Results\n")
    for i = 1:length(file15)
        fprintf("file: %s Acc = %d pre = %d rec= %d delay %d\n",files(filee(i)).name,KNNacc15(i),KNNpre15(i),KNNrec15(i),KNN15(i))
    end
	fprintf("LDR:\n")
    fprintf("ALL Channels Results\n")
    for i = 1:length(filee)
        fprintf("file: %s Acc = %d pre = %d rec= %d delay %d\n",files(filee(i)).name,LDRacce(i),LDRpree(i),LDRrece(i),LDRe(i))
    end 
	fprintf("Front Channels Results\n")
    for i = 1:length(file15)
        fprintf("file: %s Acc = %d pre = %d rec= %d delay %d\n",files(filee(i)).name,LDRacc15(i),LDRpre15(i),LDRrec15(i),LDR15(i))
    end
end

