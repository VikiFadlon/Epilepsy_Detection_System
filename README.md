# Epilepsy-Detection-system 
This project is a Final project at B.s.c of electrical engineering course in HIT- by dr' Belberg Michal.

# Project details
This project describes an experiment about epilepsy detection system using EEG siganls with low channels count.
The system develop on entropy & energy features with machine learning classifiers SVM, KNN and LDA (the algorithm based on [article](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6147694/))
The operate with constant size continuous window over the time samples, for each window the algorithm extract entropy from the time domain and energy of constant frequencies boundaries at frequency domain. each window labeled for seizures activite for the classifiers.    
figure
This project use [CHB-MIT dataset](https://physionet.org/content/chbmit/1.0.0/chb01/#files-panel) for learning and testing the project results.

# what inside 
### Code ### 
* [main.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/main.m) - Main file for the algorithm.
 * [chack_args.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/chack_args.m) - Chack arguments values.
 * [load_files.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/load_files.m) - Load files from CHB-MIT dataset.
  * [ReadEDF.m](https://www.mathworks.com/matlabcentral/fileexchange/38641-reading-and-saving-of-data-in-the-edf) - third party code.
  * [parse_summary.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/parse_summary.m) - Parse summary seizures file to locate seizures indexes.
  * [order_content.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/order_content.m) - Order files content to global struct.
 * [split_EEG.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/split_EEG.m) - Split EEG struct to train tnd test.
 * [Remove_noisy.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/Remove_noisy.m) - Remove noisy channels algorithm.
 * [extract_dataset.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/extract_dataset.m) - Extract dataset from train struct.
   * [generate_dataset.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/generate_dataset.m) - Generate dataset from train struct.
 * [extract_dataset_test.m](https://github.com/VikiFadlon/Epilepsy_Detection_System/blob/master/extract_dataset_test.m) - Extract dataset from test struct.
    

the goal is develop system that use low number of channels and detect seizures in real time.

link to article
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6147694/ 

link to dataset
https://physionet.org/content/chbmit/1.0.0/chb01/#files-panel

download first dataset 
wget -r -N -c -np https://physionet.org/files/chbmit/1.0.0/chb01/

EEGLAB download link
https://sccn.ucsd.edu/eeglab/downloadtoolbox.php
