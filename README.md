# firstlevelACF
scripts to calculate acd parameters on first level residuals up through 3dclustsim
First script allows you to calculate acf parameters from individual residual files.

Second script then averages the acf parameters based on the individual calculations. This is where it is important to make sure only subs you want included with good data are included in that group average.


Third script is ensuring you have a group mask. This is very important! Don't ever run it without a mask- if it gives you values without a mask, it's completely false!

Forth script is just an example of your 3dclustsim script with those acf parameters added in.

Hot tip! Since ACF parameters matter so much for thresholding, try to always include those values within your manuscript. 
