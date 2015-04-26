#CodeBook.md
## How did I Clean up the Data
1. Read X_train.txt, y_train.txt and subject_train.txt using read.table().
2. Column bind the above.
3. Do the same on the test set.
4. Row bind the above two parts to merge the data.
5. Read variable names from features.txt.
6. Add “Subject” and “Activity” to the original variable names.
7. Labels the data set with these descriptive variable names.
8. Choose those variables whose name contain “mean” or “std”. “mean” is case sensitive as the last few variables that contain “Mean” in their names are not actually mean variables.
9. Then substitute the activity numbers with activity names.
10. Melt the data to transform it into a long form.

