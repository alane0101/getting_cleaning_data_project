---
title: "CodeBook.md"
author: "alane0101"
date: "August 5, 2018"
output: html_document
---

## **ORIGINAL DATA SOURCE OVERVIEW**

Please see [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for information on the original source, description of the original dataset, and citation information.

## **DATA DISCLAIMER**

Neither the original collectors of the data, nor any supporting funding agencies, bear any responsibility for uses of this dataset herein, or for interpretations or inferences based upon such uses.

# **SOURCE DESCRIPTION**

A zip file of the Human Activity Recognition Using Smartphones Dataset, Version 1.0 (UCI HAR) was downloaded, for the purposes of cleaning and tidying the dataset for future use. The original dataset included the following:

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.**

* 'activity_labels.txt': Links the class labels with their activity name.**

* 'train/X_train.txt': Training set.**

* 'train/y_train.txt': Training labels.**

* 'test/X_test.txt': Test set.**

* 'test/y_test.txt': Test labels.**

Further information on the test and trial data can be found in the original README.txt, including descriptions of all features. 

# **TRANSFORMATION DESCRIPTION**

First, all files denoted above with a double-asterisk (**) were read into RStudio using fread(), as some files from the original zip were not human readable. Additionally, 'train/subject_train.txt' and 'test/subject_test.txt' were read in, in the same manner.

Next, the columns of the test and training sets were renamed to reflect the feature variables they observed. The single-column '/subject_' objects were given the header "subject", to facilitate later merging of data and to avoid confusion with other columns with default header "V1".

The test and training datasets were then subsetted such that only measurements (features) that observed a mean or a standard deviation of some sort remained. These are reflected by the R objects 'testsubset' and 'trainsubset', respectively. While there were no edge cases involving "std()", the requirements were unclear with respect to mean. As such, the resulting subsets include all columns that observed any sort of mean, including meanFreq and gravityMean. 

Next, codes for each of six (6) types of activity, represented in R objects 'trainlabels' and 'testlabels', were replaced with the descriptions of those activities, resulting in the 'trainact' and 'testact' matricies, respectively. Descriptive names were derived from the second column of the 'activitylabels' object. The matricies' headers were changed to "activity", to facilitate later merging and to avoid confusion with other default-named columns. 

At this point, the subject, activity, and feature data (i.e., the measurements) were bound by column, for each of test and train, resulting in R objects 'testmerge' and 'trainmerge'. These were then bound by row to create one, unified dataset - 'merged' - with all of the relevant test and train data. 

Lastly, a separate tidy dataset was created from 'merged' by calculating the mean for each subject (n = 30) performing each activity (n = 6). The resulting dataframe, 'tidy_avg', has the expected 180 observations.