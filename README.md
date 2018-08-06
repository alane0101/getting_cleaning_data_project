---
title: "README"
author: "alane0101"
date: "August 5, 2018"
output: html_document
---

This document pertains to the _transformed_ UCI HAR dataset. For details about the transformation, please reference 'CodeBook.md'. For details about the untransformed dataset, please reference 'README.txt' in the UCI HAR folder.

All transformation of the dataset is performed with one script: 'run_analysis.R'. The goals of the transformation were as follows: (1.) tidy the data for later use, with emphasis on replacing coded and default labels with descriptive ones; (2.) subset the data so that only those sensor-related measurements pertaining to mean or standard deviation remained; (3.) to combine the 'test' and 'training' datasets; and (4.), create a new, tidy dataset that reflects the mean of each (remaining) measurement, by subject and activity. In the given instructions, there was some ambiguity with respect to the aims of the second goal. Namely, it is not clear whether the instructors intended to reference _mean()_ in R, or the colloquial concept, which would extend to several other measurements. The liberal approach was taken, out of caution.

The 'merged' object returns a dataframe that satisfies the first three (3) conditions. The 'tidy_avg' relies on 'merged' to satisfy the fourth (4) requirement.

The _run_analysis.R_ script relies on relative paths. All necessary files, including the script, are located in the *_UCI HAR Dataset_* folder.

