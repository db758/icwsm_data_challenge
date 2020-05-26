# Examining Racial Bias in an Online Abuse Corpus with Structural Topic Modeling

This repository contains code to reproduce analysis in "Examining Racial Bias in an Online Abuse Corpus with Structural Topic Modeling"
by Thomas Davidson and Debasmita Bhattacharya, forthcoming as part of the 2020 ICWSM Data Challenge.

## Instructions

To reproduce the analysis you will need to do the following. Necessary Python and R packages will need to be installed. Please see comments in relevant files for more detailed instructions:

  1. To avoid redundancy the files for race classification are not replicated here. You will need to clone this [repository](https://github.com/slanglab/twitteraae) and copy the contents to the `race_classifier` directory.
  2. Use Python 2.7 to run `race_classifier/race_founta.py`. This script implements the code from Blodgett et al. 2016. This creates a new version of the data file with race annotations in `race_classifier/data`.
  3. Use Juypter Notebooks with a Python 3.6 kernel to run `race_classifier/recode_race_annotations.ipynb`. This modifies the annotations from the previous step and outputs a new file in `race_classifier/data`.
  4. Run `code/trainingSTMfinal.Rmd` in RStudio using RMarkdown. We suggest reading the comments carefully and running each cell individually. It may take several hours to run the searchK function so this step can be omitted. The code also contains instructions for downloading our `RData` file to load the final model used in the paper.

## Disclaimer

This repository will not be actively maintained, although we will try to respond to Github Issues and other inquiries.
