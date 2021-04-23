#!/bin/bash
#--------------------------------------------------------------
#
#SBATCH --job-name=3dClustSim
#SBATCH --output=output/3dClustSim.log
#SBATCH --error=output/3dClustSim_err.log
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4g
#SBATCH --partition=general

module load afni

# Set path to the RX directory to save output
rx_path=/nas/longleaf/home/jess1/whole-brain-dev-social/analysis/thresholding

# Set path to the mask used in analyses
mask=//nas/longleaf/home/jess1/whole-brain-dev-social/analysis/thresholding/group_mask_acrosswave.7.nii

# Run 3dClustSim using the average acf outputs from the script "calcualte_average_ACF.Rmd"
3dClustSim -mask ${mask} -acf 0.555380169013242 4.61362680991569 12.3309040184921 > ${rx_path}/threshold.txt
