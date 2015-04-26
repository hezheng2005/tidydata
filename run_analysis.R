run_analysis <- function (path){ #PATH is where the files were unziped.
        library(dplyr)
        train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
        subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        ttrain <- cbind(subtrain,ytrain,train)
        test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
        subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        ttest <- cbind(subtest,ytest,test)
        data1 <- rbind(ttrain,ttest)
        features <- read.table("./UCI HAR Dataset/features.txt")
        cnames <- c("Subject", "Activity",as.character(features[,2]))
        colnames(data1) <- cnames
        m <- grep("mean",f[,2])
        s <- grep("std",f[,2])
        ms <- sort(c(m,s))
        data2 <- data1[ms]
        for (i in 1:nrow(data2)){
                if (data2[i,2]=="1") data2[i,2] <- "WALKING"
                else if (data2[i,2]=="2") data2[i,2] <- "WALKING_UPSTAIRS"
                else if (data2[i,2]=="3") data2[i,2] <- "WALKING_DOWNSTAIRS"
                else if (data2[i,2]=="4") data2[i,2] <- "SITTING"
                else if (data2[i,2]=="5") data2[i,2] <- "STANDING"
                else data2[i,2] <- "LAYING"
        }
        tidydata <- melt(data2,id=c("Subject","Activity"))
        write.table(tidydata,file="tydydata.txt",row.names=FALSE)
        
}