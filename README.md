# 2028-United-States-Presidential-Election-Primary-Poll-Tracking

## Purpose

The purpose of this project is to track polls and identify polling trends for potential candidates in the 2028 United States Presidential Election Primaries for both the Democratic and Republican Party, while also making trend-based inferences on voter populations.

## Procedure

Polls are stored in a local MySQL database in two separate tables, one for the Democratic Party and one for the Republican Party. Then, the tables are exported as CSV files and read into RStudio to compute summary statistics and plot line charts. Note that not all candidates are further analyzed at this step. For each party, 6 potentially competitive candidates based on personal judgement are selected and observed. Not only are there individual files created for each candidate's analysis, but a Shiny app deployed on shinyapps.io is also created for each party to aggregate all 6 candidates in one dashboard.

## Democratic Party Analyses

[All](https://ktu03.shinyapps.io/Democratic_App/)
