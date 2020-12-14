# Epilepsy-Detection-system 
This project is a Final project at B.s.c of electrical engineering course in HIT.

# Project details
This project describes an experiment about epilepsy detection system using EEG siganls with low channels count.
The system develop on entropy & energy features with machine learning classifiers SVM, KNN and LDA (the algorithm based on [article](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6147694/))
The operate with constant size continuous window over the time samples, for each window the algorithm extract entropy from the time domain and energy of constant frequencies boundaries at frequency domain. each window labeled for seizures activite for the classifiers.    

# Training Algorithm
![alt text](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/images/Training_Algorithm.png | width=100)

# Testing Algorithm
![alt text](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/images/Testing_Algorithm.png)

# Feature Extraction
![alt text](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/images/feature_extraction_algorithm.png)

This project use [CHB-MIT dataset](https://physionet.org/content/chbmit/1.0.0/chb01/#files-panel) for learning and testing the project results.

# what inside 
### Code ### 
* [main.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/main.m) - Main file for the algorithm.
  * [chack_args.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/chack_args.m) - Chack arguments values.
  * [load_files.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/load_files.m) - Load files from CHB-MIT dataset.
    * [ReadEDF.m](https://www.mathworks.com/matlabcentral/fileexchange/38641-reading-and-saving-of-data-in-the-edf) - Third party code.
    * [parse_summary.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/parse_summary.m) - Parse summary seizures file to locate seizures indexes.
    * [order_content.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/order_content.m) - Order files content to global struct.
  * [split_EEG.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/split_EEG.m) - Split EEG struct to train tnd test.
  * [Remove_noisy.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/Remove_noisy.m) - Remove noisy channels algorithm.
  * [extract_dataset.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/extract_dataset.m) - Extract dataset from train struct.
    * [generate_dataset.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/generate_dataset.m) - Generate dataset from train struct.
    * [basedFFT/extract_features.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/basedFFT/extract_features.m) - Extract entropy and energy features.
  * [extract_dataset_test.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/extract_dataset_test.m) - Extract dataset from test struct.
    * [generate_dataset_test.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/generate_dataset_test.m) - Generate dataset from test struct.
    * [basedFFT/extract_features.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/basedFFT/extract_features.m) - Extract entropy and energy features.
 * [analyze_datasets.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/analyze_datasets.m) - Analyze datasets using classifiers SVM, KNN and LDA.
 * [plot_result.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/plot_result.m) - Save and plot results

## Folders ##
* [Tools](https://github.com/VikiFadlon/Epilepsy_Detection_System/tree/master/tools) - Contain thrid party codes.
* [train_datasets](https://github.com/VikiFadlon/Epilepsy_Detection_System/tree/master/train_datasets) - Contain saved datasets from [extract_dataset.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/extract_dataset.m), if file exists the algorithm skip the [generate_dataset.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/generate_dataset.m) function.
* [test_datasets](https://github.com/VikiFadlon/Epilepsy_Detection_System/tree/master/test_datasets) - Contain saved datasets from [extract_dataset_test.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/extract_dataset_test.m), if file exists the algorithm skip the [generate_dataset_test.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/generate_dataset_test.m) function.
* [results](https://github.com/VikiFadlon/Epilepsy_Detection_System/tree/master/results) - Contain saved result files from [plot_result.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/plot_result.m), each file name contain running parameters.

## Applications ##
We developed 2 applications for further research

### [EEG_Profile_Creator](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/EEG_Profile_Creator.mlapp) ###
Run the project algorithm with user selection parameters:
* Patient - Select patient from [CHB-MIT dataset](https://physionet.org/content/chbmit/1.0.0/chb01/#files-panel).
* Channels - Select specipic channels for the algorithm.
* Window size - Select the window size for the algorithm.
* apply filter noisy channles - Apply filter noisy channles algorithm on the selected channels.
The application save the algorithm results in [/results folder](https://github.com/VikiFadlon/Epilepsy_Detection_System/tree/master/results).

![alt text](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/images/EEG_Profile_Creator.PNG)

### [EEG Result Viewer](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/EEG_Profile_Creator.mlapp) ###
load automatic after [EEG Profile Creator app](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/EEG_Profile_Creator.mlapp). Present the result file with the following features:
* Plot the Accuracy, Precision and Recall for SVM, KNN and LDA classifiers.
* Plot in time functions the True seizures values and the classifier results.
* Browse to change the current result file.
* Extract the result file content to matlab workspace.
![alt text](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/images/EEG_Result_Viewer.PNG)


