corr <- function(directory, threshold=0) {
        result <- numeric(0)
        for (file in list.files(directory)) {
                data <- read.csv(file.path(directory, file), header=TRUE)
                completeCases <- data[complete.cases(data), ]
                if (nrow(completeCases) > threshold) {
                        sulfate <- completeCases[, "sulfate"]
                        nitrate <- completeCases[, "nitrate"]
                        result <- c(result, cor(sulfate, nitrate))
                }
        }
        result
}