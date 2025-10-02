# Read in the results from the simulation study and 
# and process them into the desired format
#
# Created by: Peter S. Hovmand April 20, 2025
# Revised by: 

library(fs)
library(readr)

# This searches for the results files with filenames in the form of Results_ 
# which includes Results_1.csv, Results_10.csv, etc. but excludes Results.csv
# since this only a temporary results file
results_list <- list.files(pattern="Results_")

# Create an empty object to store the processed results
processed_results <- NULL

# The results_list object is not sorted in the order of the simulation 
# runs, hence the files are read in a numeric order
for (i in 1:length(results_list)) {
  # Read in the .csv file for simulation run i
  tmp<-read_csv(file=paste0("Results_",i,".csv"), show_col_types = FALSE)
  
  # Process the data for simulation run i
  tmp_df <- data.frame(Run = i,
                       Year = tmp$Years,
                       Pop = tmp$Population)
  # Append the processed data for simulation run i to the processed_results
  processed_results <- rbind(processed_results, tmp_df)
}

# Save the processed results
save(processed_results, file = "study_results.RData")

# Clean up the drive by deleting the individual simulation study results
file_delete(results_list)
