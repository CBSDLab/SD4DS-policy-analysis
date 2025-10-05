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

# create a vector to summarize the policy switches that are on
scenario <- apply(study1_results[,vars[SW_vec]],1, paste0, collapse="-")

# select the final population for comparisons against policy 
# scenarios
study1_results %>%
  mutate(Scenario = scenario) %>%
  filter(Years == 100) %>%
  mutate(`Final Population` = Population) %>%
  select(Scenario, `Final Population`) -> tmp

# plot the results from the policy analysis
barplot(tmp$`Final Population`,names = tmp$Scenario,
        xlab = "Scenario (SW1-SW2-SW3-SW4)",
        ylab = "Population(100)", 
        main = "Results from policy analysis study1.csv")

