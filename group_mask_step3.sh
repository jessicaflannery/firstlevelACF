#this script will create a group mask needed for 3dClustSim to accurately calculate cluster-extent thresholding
#input file is where the individual level epi-anat mask lives
#prefix is path and name of group mask
#this script is calculating the average at a 70% threshold. This % was chosen based on afni recommendations of optimal masking.



#edit and run in terminal 

module load afni

3dmask_tool -input sub*/*.results/mask_epi_anat*.nii* \
            -prefix QC/group_mask.7 -frac 0.7





#this gives you .BRIK and .HEAD files. If you want this in a .nii, use the following script

#orient to LPI puts coordinates is to have coordinates match SPM

#edit and run in terminal. If afni isn't loaded, first run module load afni
3dresample -orient LPI -input brikFile+orig.HEAD -prefix brikFile.nii 
