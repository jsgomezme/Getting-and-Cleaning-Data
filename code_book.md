Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


File with R code "run_analysis.R"
About variables:
Contain data from training tables:

# train_1 : test/X_train.txt : 7352 rows, 561 columns. Contains recorded features train data
# train_2 : test/y_train.txt : 7352 rows, 1 columns . Contains train data of activities’code labels
# subject_train: test/subject_train.txt : 7352 rows, 1 column. Contains train data of 21/30 volunteer subjects being observed
Contains data from the testing tables:

# test_1: test/X_test.txt : 2947 rows, 561 columns.Contains recorded features test data
# test_2 : test/y_test.txt : 2947 rows, 1 columns. Contains test data of activities’code labels
# subject_test : test/subject_test.txt : 2947 rows, 1 column. Contains recorded features test data
Contains data from features.txt:

# features: 561 rows, 2 columns
# Contains data from activity_labels.txt:

# activityLabels: 6 rows, 2 columns - List of activities performed when the corresponding measurements

# index : Contains std and mean

# CleanedData : Union of clean data
