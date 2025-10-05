# Imports results from study 1 for plotting and analysis
# Created by: Peter S. Hovmand October 5, 2025

# import results
library(readr)
library(tidyverse)
study1_results <- read_csv("study1_results.csv")


# get the policy switch variables
vars <- names(study1_results)
SW_vec <- grep("SW", vars)

# check time horizon
range(study1_results$Years)
ftable(study1_results[study1_results$Years==100,SW_vec])



study1_results 