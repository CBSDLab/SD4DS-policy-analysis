#! /bin/awk
# Simple AWK shell script to run a single simulation
#
# Run this with from the command line with: awk -f simulate.sh
#
# Created by: Peter S. Hovmand March 24, 2024
# Revised by: Peter S. Hovmand April 18, 2025

BEGIN {
  # Comment/uncomment lines below depending on the platform
  # STELLA_PATH="/Applications/Stella_Simulator_3.5.1_Mac_Arm/stella_simulator"
  STELLA_PATH="/home/psh39/Stella_Simulator/stella_simulator"
  
  # Set the model run simulation arguments
  STELLA_RUN=" -q 'limits to growth.stmx'"

  # Set Stella command
  STELLA_CMD=STELLA_PATH STELLA_RUN
  
  # Execute the command to run the model
  system(STELLA_CMD)
}
  
