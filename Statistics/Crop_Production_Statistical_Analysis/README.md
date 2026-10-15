## Project Overview :
- This project analyzes crop production data using Python. It explores crop production, cultivated area, yield, and agricultural trends across different years, states, districts, and crops.

## Project Objectives :
- Analyze crop production trends over the years.
- Identify the top crops by production and cultivated area.
- Compare crop production across states and districts.
- Study average crop yield.
- Understand relationships between numerical variables.
- Identify potential outliers in the data.

## Dataset :
- The dataset contains the following columns:
- State – State name, District – District name, Crop – Crop name, Crop_Year – Year of crop production,
- Season – Crop season, Area – Cultivated area, Production – Crop production, Yield – Crop yield

# Tools and Libraries :
- Python
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- Seaborn

## Analysis Performed :
- Data loading and inspection
- Missing value and duplicate checks
- Descriptive statistics
- Histograms and correlation heatmap
- Year-wise crop production analysis
- Top 5 crops by total production
- Top 5 crops by average yield
- State-wise production and average yield analysis
- District-wise crop production analysis
- Top 10 crops by cultivated area
- Outlier detection using the IQR method

## Key Findings :
- Rice and wheat were among the leading crops by total production.
- Kerala recorded the highest total crop production among the states analyzed.
- Tumakuru recorded the highest total production among the districts analyzed.
- Rice had the largest total recorded cultivated area.
- Production and yield showed a moderate positive relationship.
- The IQR method identified potential outliers in Area (16.60%), Production (17.65%), and Yield (15.10%).

## Conclusion :
- This project provides an overview of agricultural production using statistical analysis and data visualization.
- It highlights differences in crop production, cultivated area, and yield across crops and locations.
- It also shows the importance of checking unusual values and data errors before drawing conclusions.

## Limitations :
- The dataset contains much fewer records for 2020 than for 2019, which affects year-wise comparisons.
- Potential outliers may represent genuine agricultural differences or data errors.
- Yield values and measurement units should be verified against the original dataset documentation.
