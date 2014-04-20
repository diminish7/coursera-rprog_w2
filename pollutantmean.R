pollutantmean <- function(directory, pollutant, id=1:332) {
        all = NULL
        for (i in id) {
                file <- file.path(directory, paste(sprintf("%03d", i), ".csv", sep=""))
                data <- read.csv(file, header=TRUE)
                notNA <- !is.na(data[, pollutant])
                all <- c(all, data[notNA, pollutant])
        }
        mean(all)
}