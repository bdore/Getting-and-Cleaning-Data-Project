##load packages for the script
library(data.table)
library(dplyr)

##############################################
################# PART 1 #####################
##############################################

##Function creates one tidy data frame for a dataset.
##The dataset (train or test) is passed as a parameter of type 'character'.
runAnalysis <- function(dataset){
        
        ##reads in all necessary files
        labels_file <- paste0(dataset, "/y_", dataset, ".txt")
        set_file <- paste0(dataset, "/X_", dataset, ".txt")
        subjects_file <- paste0(dataset, "/subject_", dataset, ".txt")
        
        labels <- fread(labels_file)
        set <- fread(set_file)
        subjects <- fread(subjects_file)
        features_names <- fread("features.txt")
        
        ##tidy up features names
        features_names <- features_names$V2
       
        ##assign activities to labels and tidy up 
        labels[labels == 1] <- "WALKING"
        labels[labels == 2] <- "WALKING_UPSTAIRS"
        labels[labels == 3] <- "WALKING_DOWNSTAIRS"
        labels[labels == 4] <- "SITTING"
        labels[labels == 5] <- "STANDING"
        labels[labels == 6] <- "LAYING"
        setnames(labels, "V1", "Activity")
        
        ##combines subjects and activities, tidy up
        subjects_labels <- cbind(subjects, labels)
        setnames(subjects_labels, "V1", "Subject")
        
        ##creates a column to identify the dataset
        subjects_labels$Dataset <- dataset
        
        ##rename variables of the set using the feature names
        j <- 1:length(features_names)
        for(i in j){
                setnames(set, paste("V", i, sep = ""), features_names[i])
        }
        
        ##combines subjects, activities, labels and measurements in data frame 'x'
        x <- cbind(subjects_labels, set)
        
        ##assigns the value of 'x' to a tidy dataset in the global environment
        ##dataset created is 'test_data' or 'train_data'
        assign(paste(dataset, "_data", sep = ""), x, pos = 1)
}

##runs the above function for each the datasets
runAnalysis("test")
runAnalysis("train")

##combines both test and train datasets
merged_set <- rbind(test_data, train_data)

##extracts the columns relative to means and standard deviations
extracted_set <- select(merged_set, 1:3, contains("mean()"), contains("std()"))

##############################################
################# PART 2 #####################
##############################################

##stores all unique subjects and activities in separate vectors for later use
subjects_list <- c(unique(extracted_set$Subject))
activities_list <- c(unique(extracted_set$Activity))

##data frame created to hold all values of interest
final_data <- data.frame()

##function created to calculate the mean of each measurement of each activity for each subject
##the subject is passed as a parameter of type 'number'
runAverage <- function(subject){
        
        for(j in 1:length(activities_list)){
                
                ##filter extracted set by activity and subject
                x <- filter(extracted_set, Activity == activities_list[j] & Subject == subject)
                
                ##selects measurement variables
                x <- select(x,4:ncol(x))
                
                ##stores variable names for later reconstruction of data frame
                var_names <- c("Subject","Activity",names(x))
                
                ##calculate the average for each measurement
                y <- sapply(x, mean) %>% unname()
                
                ##creates a temporary data frame 'z' with one row to store one observation
                z <- as.data.frame(matrix(ncol = length(var_names), nrow = 1))
                
                ##assigns variable names to columns in 'z'
                colnames(z) <- var_names
                
                ##assigns values to variables in 'z'
                z[1,1] <- subject
                z[1,2] <- activities_list[j]
                for(k in 1:length(y)){
                        z[1,2+k] <- y[k]
                }
                
                ##each iteration in the loop binds the 'z' to the 'final_data' data frame
                final_data <<- rbind(final_data, z)
        }
}

##runs the above function for each subject
for(i in 1:length(subjects_list)){
        runAverage(subjects_list[i])
}

##writes output to csv file
write.table(final_data, file = "average.txt", row.names = F)