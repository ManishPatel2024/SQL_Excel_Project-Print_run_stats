# Graphic artwork statistics

This is a personal project that I have wanted to complete ever since I started working with SQL. During my years as a Senior Designer in a Retail HQ, I've wanted to calculate the number of individual artworks we have worked on in a given year or multiple years across different brands. It's a relatively simple project but trying to find the data and manipulate it was a difficult endeavour.

### 💡 Key Insights & Findings
* Total number of artworks for print run briefs: **Just over 30,000**. This does not include the ad-hoc projects.

* Higest number of artworks in a single month: **2,000 artworks in August 2023**.

* Large print runs vs Medium print runs: **33% Large vs 67% medium**. Large = anything over 500 artworks in a single month.

### 📁 Dataset Overview
This dataset was downloaded from the printers portal that i had access to. I downloaded the report which covered every single item that had been sent to print. I filtered the data from DEC 2021. I downloaded 3 x csv files for 3 different brands. 

🛠️ Key Technical Skills includes:  
<ins>Data Cleaning</ins> A lot of redundant data that needed to be dropped. The date column was incorrectly boughtinto MySQL as text which I had to correct. 

<ins>Advanced Data Scrubbing:</ins> Using regular expressions and LIKE clauses, I filtered the data set to gather the rows i needed. 

<ins>Statistical Analysis:</ins> Once I exported the dataset out from MySQL as a csv, I imported this into Excel to finish my data cleaning to remove further unwanted rows and performed initial data analysis using Pivot Tables. I also incorporated an IF statement to categorise the data to give my Medium and Large print runs.



### 🧹 Phase 1: Data Cleaning Highlights
The raw data contained several columns that had no meaning for my objective. It was also missing a brand column as I intended to append the 3 tables in MySQL. 

Date column data type: MySQL brought in the date column as a text field which had to be rectified using the STR_TO_DATE function.



### 📊 Phase 2: Exploratory Data Analysis
With the tables cleaned and joined, I exported a csv file that I could use in excel to perform EDA and build a dashboard to showcase the derived stats. 

Line chart to show trend from DEC 2021 - FEB 2026.  

Pie chart to show a split of Large print run vs a Medium print run during DEC 2021 - FEB 2026.

Bar chart to show the number of print runs during DEC 2021 - FEB 2026.

KPI card to show the number of individual artworks sent to print during DEC 2021 - FEB 2026.
