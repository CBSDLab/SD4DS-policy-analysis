#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -t 1:00:00
#SBATCH --output=my.stdout 
#SBATCH --mail-user=<your email address>
#SBATCH --mail-type=ALL 
#SBATCH --job-name="<name of study>"

#SBATCH -o serial-R.out%j # capture jobid in output file name

# run simulation study using AWK script
awk -f simulate_scenarios.awk -v MODEL="<Stella .stmx model>" <Study.csv file>

# load R module to process results
module load R/4.1.2-foss-2021b
Rscript process_results.R

# copy processed results to study results file
cp study_results.csv <name of study>.csv
