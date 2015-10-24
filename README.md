#Purpose
The purpose of this repo is to fulfill the requirements of the Coursera.org class "Getting and Cleaning Data".

#Contents of this repo
- README.md is the file you are reading.
- CodeBook.md explains the variables output by run_analysis.R script
- run_analysis.R creates new features from the UCI data set that can be obtained [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- .gitignore is a simplified ignore file for this repo I'm using and may be used as a starting point for any contributor.


#Getting the Code to Run
I assume you have a session of R setup and running and have installed the library dplyr from the CRAN repository.
You must also have unzipped the original data file into your working directory.  Your working directory should contain a file "UCI HAR Dataset/" after unzipped.

The script uses windows file structure with the "/" and I'm unsure of how that will work on a Linux or Mac machine so be advised.


#The output of run_analysis.R
The output of this script will be a tidy data set as required by the coursera.org class "Getting and Cleaning Data".  This
data set will then be output as a txt file named "featMeanByActForSubject.txt" that may be read back into an R data frame by
the command `read.table("featMeanByActForSubject.txt", header = TRUE)`
