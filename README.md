# USA Household Income: Data Cleaning & EDA

This project focuses on cleaning and analyzing US Household Income data at the State, City, and County levels. The primary goal was to merge geographic data with economic statistics to identify wealth distribution patterns across the United States.

### 💡 Key Insights & Findings
* Regional Disparities: The analysis clearly showed a high concentration of wealth in specific "Types" of municipalities, with Boroughs often outperforming standard Cities in average income.

* Data Correlation: There was a notable (though not absolute) correlation between land area and household count in certain regions.

* Top Performers: [Insert a specific finding here, e.g., "Maryland and New Jersey emerged as top-tier states for median household income in this dataset."]

### 📁 Dataset Overview
The dataset contains life expectancy data for various countries over a 15-year period, including variables like GDP, Adult Mortality, and status (Developed vs. Developing).

🛠️ Key Technical Skills includes:  
<ins>Relational Data Management:</ins> Performing INNER JOINS to connect geographic data with income statistics.

<ins>Advanced Data Scrubbing:</ins> Standardizing "State Name" typos, fixing "City" casing issues, and managing 0 values in land/water area measurements..

<ins>Statistical Analysis:</ins> Using AVG, MEDIAN (logic-based), and COUNT to rank economic performance by region and "Type" (e.g., City, Borough, CDP, Town).



### 🧹 Phase 1: Data Cleaning Highlights
The raw data contained several structural issues that required SQL intervention:

Duplicate ID Removal: Used ROW_NUMBER() to identify and remove duplicate entries based on unique id values.

Geographic Standardization: Fixed "State_Name" inconsistencies (e.g., converting 'alabama' to 'Alabama') and cleaned up the "State_ab" fields.

Zero-Value Management: Filtered out records where ALand or AWater were 0 or Null to ensure geographic calculations remained accurate.



### 📊 Phase 2: Exploratory Data Analysis
With the tables cleaned and joined, I explored several key economic questions:

Top & Bottom Earners: Which states boast the highest average income? (Filtering out outliers with low sample sizes).

The "Type" Factor: How does income differ between a "Borough," a "City," and a "Village"?

Wealth Distribution: Identifying the top 10 wealthiest cities in the highest-earning states.
