#! /bin/awk
# Simple AWK shell script to read parameters from study1.csv for a 
# simulation study and sending each line to the Parms.csv file that is 
# read by the Stella model and then simulates the model using 
# Stella Simulator. After simulating the model, the Results.csv file, which 
# is the output from the Stella model, are processed by the R script
# process_run.R and appended to the study results file. 
# 
# Run this with from the command line with: 
#   awk -f simulate_study.awk -v MODEL="limits to growth.stmx" study1.csv
#
# Created by: Peter S. Hovmand March 24, 2024
# Revised by: Peter S. Hovmand April 18, 2025 for workshop
#             Peter S. Hovmand April 19, 2025 
#             Peter S. Hovmand October 3, 2025

BEGIN {
  # Comment/uncomment lines below depending on the platform
  # STELLA_PATH="/Applications/Stella_Simulator_3.5.1_Mac_Arm/stella_simulator"
  STELLA_PATH="/home/psh39/Stella_Simulator/stella_simulator"
  
  # Set the model run simulation arguments
  STELLA_RUN=" -q " "'" MODEL "'"

  # Set Stella command
  STELLA_CMD=STELLA_PATH STELLA_RUN
}

# Pulls the variable names from the top row of the csv file of parameters
NR == 1 {
  varnames = $0
  print STELLA_CMD
  }
  
# Saves each row as a .csv file that can be dynamically linked and
# and run with a Stella model
NR >1 {
  # write the parameters for the row to the Parms.csv import file
  print varnames "\n" $0 > "Parms.csv"
  close("Parms.csv")
  
  # run the model
  system(STELLA_CMD)
  
  # copy results to a unique file for the run
  TMP="cp Results.csv " "Results_" NR-1 ".csv" 
  system(TMP)
  } 
  
