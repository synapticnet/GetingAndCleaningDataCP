#Feature Extraction

This code book describes the features the R script run_analysis.R creates as an output.  These features are extracted from the original features given in the UCI data set and retain the same names for coding and referential convenience.

The origin of each feature is contained in the features_info.txt file contained with the original data set downloadable [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  I have also created a simplified explanation at the bottom of this file for convenience.


##Subject and Activity

This study has 30 subjects represented by IDs 1-30, and 6 activities represented by a descriptive label.

- subject = an INTEGER subject ID from the original data set from which it was derived
    
- activity = a CHARACTER string derived by replacing the original data sets activity id with an appropriate descriptive label.  They are provided here next to their original IDs.
    - 1 = walking
    - 2 = walking_upstairs
    - 3 = walking_downstairs
    - 4 = sitting
    - 5 = standing
    - 6 = laying


##All other features

All other features retain their original name. Only the mean and standard deviation features were extracted from the original data set. They were then derived in this data set by separating out each subject's data by ID from the original data set. Then each subject was then further divided into each activity and the average was calculated.

Features from the original data set denoted with angle() were excluded from the selection process as I felt they were separate features and not means calculated from the original features.

The features here represents the subjects average for the named feature over each activity.


    Time domain features
    ===================
    tBodyAcc-mean()-X
    tBodyAcc-mean()-Y
    tBodyAcc-mean()-Z
    tBodyAcc-std()-X
    tBodyAcc-std()-Y
    tBodyAcc-std()-Z
    tGravityAcc-mean()-X
    tGravityAcc-mean()-Y
    tGravityAcc-mean()-Z
    tGravityAcc-std()-X
    tGravityAcc-std()-Y
    tGravityAcc-std()-Z
    tBodyAccJerk-mean()-X
    tBodyAccJerk-mean()-Y
    tBodyAccJerk-mean()-Z
    tBodyAccJerk-std()-X
    tBodyAccJerk-std()-Y
    tBodyAccJerk-std()-Z
    tBodyGyro-mean()-X
    tBodyGyro-mean()-Y
    tBodyGyro-mean()-Z
    tBodyGyro-std()-X
    tBodyGyro-std()-Y
    tBodyGyro-std()-Z
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y
    tBodyGyroJerk-mean()-Z
    tBodyGyroJerk-std()-X
    tBodyGyroJerk-std()-Y
    tBodyGyroJerk-std()-Z
    tBodyAccMag-mean()
    tBodyAccMag-std()
    tGravityAccMag-mean()
    tGravityAccMag-std()
    tBodyAccJerkMag-mean()
    tBodyAccJerkMag-std()
    tBodyGyroMag-mean()
    tBodyGyroMag-std()
    tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag-std()
    
    
    Frequency domain features
    ==========================
    fBodyAcc-mean()-X
    fBodyAcc-mean()-Y
    fBodyAcc-mean()-Z
    fBodyAcc-std()-X
    fBodyAcc-std()-Y
    fBodyAcc-std()-Z
    fBodyAcc-meanFreq()-X
    fBodyAcc-meanFreq()-Y
    fBodyAcc-meanFreq()-Z
    fBodyAccJerk-mean()-X
    fBodyAccJerk-mean()-Y
    fBodyAccJerk-mean()-Z
    fBodyAccJerk-std()-X
    fBodyAccJerk-std()-Y
    fBodyAccJerk-std()-Z
    fBodyAccJerk-meanFreq()-X
    fBodyAccJerk-meanFreq()-Y
    fBodyAccJerk-meanFreq()-Z
    fBodyGyro-mean()-X
    fBodyGyro-mean()-Y
    fBodyGyro-mean()-Z
    fBodyGyro-std()-X
    fBodyGyro-std()-Y
    fBodyGyro-std()-Z
    fBodyGyro-meanFreq()-X
    fBodyGyro-meanFreq()-Y
    fBodyGyro-meanFreq()-Z
    fBodyAccMag-mean()
    fBodyAccMag-std()
    fBodyAccMag-meanFreq()
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()
    fBodyBodyAccJerkMag-meanFreq()
    fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag-std()
    fBodyBodyGyroMag-meanFreq()
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std()
    fBodyBodyGyroJerkMag-meanFreq()



#Feature Naming for original data

Each feature name is a combination of codes to denote how it was obtained.  I will summarize it here and more information can be found about each feature in the README and features_info.txt files contained int he original data set downloadable [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


##First Code
Denotes if the feature represents Time or Frequency domain.

- t = Time domain
    - time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
    
- f = Frequency domain
    -Fast Fourier Transform (FFT) was applied to the signal denoted by the rest of the name.
    
    
##Second Code
Represents the source of the applied force.

- Body and BodyBody = body induced signal
    - Separated out of the acceleration signal by using a low pass butteworth filter with a corner frequency of 0.3 Hz.

- Gravity = gravity induced signal
    - Separated out of the acceleration signal by using a low pass butteworth filter with a corner frequency of 0.3 Hz.


##Third Code
Denotes which instrument the signal came from.

- Acc = Accelerometer
- Gyro = Gyroscope


##Modifier fourth possition
Not always present.  If present denotes signal is a calculated jerk signal.

- Jerk = Jerk signal
    - body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
    
##Modifier fourth or fith posstion
Not always present.

- Mag = Magnitude
    - magnitude of these three-dimensional signals were calculated using the Euclidean norm 


##Modifier last possition before function modifier
Denotes axis of signal

- X
- Y
- Z
- XYZ = denotes 3-axial signals in the X, Y and Z directions.


##Function Modifiers
If present denotes the function used on the original feature vector to obtain the new feature.

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.


##Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean
