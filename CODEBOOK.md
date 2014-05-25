CodeBook
========================================================

<h2>Variables</h2>

tidy_data.txt has 81 variables:

Subject: this is the id of the subject, whose mean and std values are contained in variables 3 to 81 of the same row.

Activity: this is the activity that was performed by the subject leading to the values found in variables 3 to 81

Variables 3 to 48: these are the mean values for the different meassurements. 

Variables 49 to 81: these are the std values for the differnet meassurements.

<h2>Data</h2>

The raw data contains various variables distributed over a several files from to different sets, i.e. a training and a test set.

The tidy data summarizes data relevant for the task (variables representing mean or std values) from both sets in a single file. Further activities are labeled as such.

<h2>Transformations</h2>
After reading in'y_test.txt"" and 'y_train.txt', the activities were relabeled according to 'activity_labels.txt'.

Using 'grep' relevant variables were determined and used to remove irrelevant variables from both test and training set.

For both, test and training set, the corresponding files were combined in two files containing all the information from each set. 

The two files were then combined into a single file containing all relevant information aka tidy data.

The tidy data was analyzed using the 'reshape2' library and in particular the functions 'melt' and 'dcast'.




