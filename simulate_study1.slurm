#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -t 1:00:00
#SBATCH --output=my.stdout 
#SBATCH --mail-user=<your email address>
#SBATCH --mail-type=ALL 
#SBATCH --job-name="Study 1 Limits to Growth"

#SBATCH -o serial-R.out%j # capture jobid in output file name

# run simulation study using AWK script
echo "Study 1 Limits to Growth" > timing_study1.out
time(
    # run simulation study using AWK script
    awk -f simulate_study.awk -v MODEL="limits to growth.stmx" study1.csv

    # load R module to process results
    module load R/4.1.2-foss-2021b
    Rscript process_results.R
) 2>> timing_study1.out
