# Examining Racial Bias in an Online Abuse Corpus with Structural Topic Modeling

This repository contains code to reproduce analysis in "Examining Racial Bias in an Online Abuse Corpus with Structural Topic Modeling"
by Thomas Davidson and Debasmita Bhattacharya, forthcoming as part of the 2020 ICWSM Data Challenge.

## Instructions

To reproduce the analysis you will need to do the following. Necessary Python and R packages will need to be installed. Please see comments in relevant files for more detailed instructions:

  1. To avoid redundancy the files for race classification are not replicated here. You will need to clone this [repository](https://github.com/slanglab/twitteraae) and copy the contents to the `race_classifier` directory.
  2. Use Python 2.7 to run `race_classifier/race_founta.py`. This script implements the code from Blodgett et al. 2016. This creates a new version of the data file with race annotations in `race_classifier/data`.
  3. Use Juypter Notebooks with a Python 3.6 kernel to run `race_classifier/recode_race_annotations.ipynb`. This modifies the annotations from the previous step and outputs a new file in `race_classifier/data`.
  4. Run `code/trainingSTMfinal.Rmd` in RStudio using RMarkdown. We suggest reading the comments carefully and running each cell individually. It may take several hours to run the searchK function so this step can be omitted. The code also contains instructions for downloading our `RData` file to load the final model used in the paper.

## Supplementary Materials

[This](https://docs.google.com/spreadsheets/d/1LIooDBx0RMyHh5DoQ5KF22JUFZnyQzMZHfFG6XMEVqI/edit?usp=sharing) spreadsheet contains information on each topic identified by the STM. The names were given by the authors. The first sheet contains a list of topics names, including 5 words with highest FREX score for each topic. The second sheet contains tweet examples for each of the 30 topics, both named and unnamed, as mentioned in the paper. For each topic we list the 5 words with the highest FREX score and highest probability, along with the 10 tweets with the highest proportion of the topic.

[Figure S1](https://github.com/db758/icwsm_data_challenge/blob/master/STM/notes/final_diagnostics.png) shows the four different diagnostics calculated for topics with `k` ranging from 10 to 60.

## Disclaimer

This repository will not be actively maintained, although we will try to respond to Github Issues and other inquiries.
