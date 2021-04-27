# firstlevelACF
scripts to calculate acd parameters on first level residuals up through 3dclustsim

1) First script allows you to calculate acf parameters from individual residual files.

2) Second script then averages the acf parameters based on the individual calculations. This is where it is important to make sure only subs you want included with good data are included in that group average.


3) Third script is ensuring you have a group mask. This is very important! Don't ever run it without a mask- if it gives you values without a mask, it's completely false!

4) Forth script is just an example of your 3dclustsim script with those acf parameters added in.

## NOTE for manuscripts:
A) Include ACF values used for 3dClustsin IN manuscript, noting obtained from first level residuals. 
B) Include voxel size.
--> Between those two pieces of information, you should be able to quickly verify your own and have reviewers quickly verify if your values are within an expected range for P/K ratio.

# *The WHYS*

## WHY do you need to calculate first level?
Going between SPM and afni, you MUST calculate acf parameters from first level model. It is not correct to calculate acf paramaters from group level residual files. This must be done at first level to get accurate cluster-level thresholding parameters.
Can read up on this in our paper here including what should be reported in methods so others can quickly glance and have a good sense if your p/k ratio makes sense: https://www.sciencedirect.com/science/article/pii/S1878929320300554
and our tutorial here: https://osf.io/y2nm8/ 
see: https://afni.nimh.nih.gov/pub/dist/doc/program_help/3dFWHMx.html
From AFNI 
  *** Do NOT use 3dFWHMx on the statistical results (e.g., '-bucket') from ***
  *** 3dDeconvolve or 3dREMLfit!!!  The function of 3dFWHMx is to estimate ***
  *** the smoothness of the time series NOISE, not of the statistics. This ***
  *** proscription is especially true if you plan to use 3dClustSim next!! ***
 
  *** -------------------                                                  ***
  *** NOTE FOR SPM USERS:                                                  ***
  *** -------------------                                                  ***
  *** If you are using SPM for your analyses, and wish to use 3dFHWMX plus ***
  *** 3dClustSim for cluster-level thresholds, you need to understand the  ***
  *** process that AFNI uses. Otherwise, you will likely make some simple  ***
  *** mistake (such as using 3dFWHMx on the statistical maps from SPM)     ***
  *** that will render your cluster-level thresholding completely wrong!   ***

## WHY/WHATs of impacts on thresholds

Things that can affect your cluster-extent threshold values from 3dclustim.
-voxel smoothing (the size of your ACF parameters will give you a good ballpark of stringency)
-voxel size (short hand- think larger voxel covers more space, small k needed)
-relatedly, your mask. 

See afni message board thred on this topic to better understand importance of accurate mask, not just for number of voxels you are covering, but the correct voxel dimensions: https://afni.nimh.nih.gov/afni/community/board/read.php?1,165851,166000#msg-166000

summary from afni "I am actually surprised that 3dClustSim runs at all without any mask given, because then it has to guess at a grid. I will have to look more deeply into the code to see how it picks the grid and voxel size in such a case (the terminal text suggest it depends on ACF params), but I would not run 3dClustSim without providing a "-mask .." to specify this kind of information, regardless of whether that mask really is a brain mask or a whole FOV "mask". "
