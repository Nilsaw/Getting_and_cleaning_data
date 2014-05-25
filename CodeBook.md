## Course project CodeBook.
===========================

### Object definitiion
Definitions of some important objects.

No  | Object Name | Object Definition
--- | --- | ---
1  | X_train | Object which reads the data from the X_train file
2  | X_test | Object which reads the data from the X_test file
3  | subject_train | Object which reads the data from the subject_train file
4  | subject_test | Object which reads the data from the subject_test file
5  | y_test | Object which reads the data from the y_test file
6  | features | Object which reads the data from the features file
7  | activities | Object which reads the data from the activities_table file
8  | x_table | Object containing the row binded data from X_train and X_test
9  | subject | Object containing the row binded data from subject_train and subject_test
10  | y_table | Object containing the row binded data from y_train and y_test
11  | indices_of_good_features | Holds the mean and standard deviation data from the features column 
11  | tidyData |  One data set which contains the training and the test sets. 
11  | result | Independent tidy data set with the average of each variable for each activity and each subject.  

### Data generated
* [TidyData.txt](TidyData.txt) contains the merged data set with the mean and standard deviation values.
* [dataSetContainingaverages.txt](dataSetContainingaverages.txt) contains the written into by the result object.

