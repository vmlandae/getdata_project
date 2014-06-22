Introduction

This is a code useful to analyze raw data collected data collected from the accelerometers of some Samsung Galaxy S smartphones. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data consist in experiments with a group of 30 individuals (the subjects). Each person performed six different activities wearing a smartphone on the waist.
The signals measured during these activities were then subjected to additional filtering and transformations. In total, 561 features were reported per observation.


For all these variables, i have selected all the variables containig the means (mean()) and the standard deviations (std()) of each variable. For each subject-activity pair, i have calculated the average value of these means and standard deviations for each feature

Instruction list

    Unzip the data, mantainig the original folder structure.
    Paste run_analysis.R in the main directory
    Run run_analysis.R
    The output file (the tidy data) is tidy_average_activity_subject.txt

The R script run_analysis.R with R version 3.1.0 

    The codebook containing the detailed description of all variables can be found in CODEBOOK.md (available in this repository).
