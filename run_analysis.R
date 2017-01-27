# Step 1: Load the datasets into my workspace.

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
s_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Step 2: Merge the data sets.

x_set <- rbind(x_test, x_train)
y_set <- rbind(y_test, y_train)
s_set <- rbind(s_test, s_train)

# Step 3: Extract the mean an std for each measurement.

# Load the features data and search labels with mean or std.
features <- read.table("UCI HAR Dataset/features.txt")
pattern <- grep("mean|std", features[ ,2])

# Subset the columns with the mean or std labels.
x <- x_set[ , pattern]

# Step 4: Name the variables.

names(x) <- features[pattern, 2]

# Step 5: Name the activities.

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
y_set[ , 1] <- activities[y_set[ , 1], 2]
names(y_set) <- "activity"

# Step 6: Merge subject, x and y.

# Name the subject column before merging.
names(s_set) <- "subject"

xys <- cbind(s_set, y_set, x)

# Sort the data set.
library(dplyr)
xys <- arrange(xys, subject, activity)

# Step 7: Create a tidy data set with the average of 
# each variable for each activity and each subject.

# Load plyr package and apply ddply on columns 3:81 (the first 2 are subject and activity)
library(plyr)
final <- ddply(xys, .(subject, activity), function(x) colMeans(x[ , 3:81]))

# Create the file with the independent tidy data set.
write.table(final, "averages.txt", row.names = FALSE)