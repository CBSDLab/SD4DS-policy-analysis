# This creates the study1.csv file for the "Limits to Growth" policy analysis
# Created by: Peter Hovmand October 5, 2025
# Revised by: 

# Load and view the template
library(readr)
Template <- read_csv("Template.csv")

# Create the study1_df
study1_df <- Template

# Find the columns with the policy switches
SW_vec <- grep("SW", names(Template))

# For each switch, add a row that turns the switch on
for (sw in SW_vec) {
  # create a temporary row from the first row of the base simulation
  tmp <- study1_df[1,]  
  
  # set the switch to 1 (on)
  tmp[,sw] <- 1
  
  # add the row to the simulation study data frame
  study1_df <- rbind(study1_df,tmp)
}

# write the results to the Study1.csv
write_csv(study1_df,"Study1.csv")
  

