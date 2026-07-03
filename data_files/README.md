# blr_mort_weather.csv Metadata

## Dataset Information

**Dataset Name:** blr_mort_weather.csv

**Rows:** 229  
**Columns:** 12  
**Temporal Resolution:** Monthly  
**Spatial Resolution:** Bengaluru Urban District and Bengaluru Rural District, Karnataka, India  
**Time Period:** January 2001 – December 2023 (excluding 2006, 2020–2022 and 2024)  
**File Format:** CSV  

---

## Description

This dataset combines monthly mortality records for Bengaluru Urban and Bengaluru Rural districts with monthly weather observations. It was created to investigate relationships between climate variability, particularly temperature and rainfall, and monthly mortality.

Daily weather observations were aggregated to monthly values before being merged with transcribed mortality records.

---

## Variables

| Variable | Type | Description |
|----------|------|-------------|
| `id` | Integer | Chronological number. |
| `year` | Integer | Observation year. |
| `month` | Integer | Observation month (1–12). |
| `urban_m_ct` | Integer | Total registered deaths in Bengaluru Urban district during the month. |
| `rural_m_ct` | Integer | Total registered deaths in Bengaluru Rural district during the month. |
| `mid_yr_pop_u` | Integer | Government-estimated mid-year population for Bengaluru Urban district. |
| `mid_yr_pop_r` | Integer | Government-estimated mid-year population for Bengaluru Rural district. |
| `deaths_per_ten_k_u` | Numeric | Monthly mortality rate per 10,000 population for Bengaluru Urban district. Calculated as `(urban_m_ct / mid_yr_pop_u) × 10,000`. |
| `deaths_per_ten_k_r` | Numeric | Monthly mortality rate per 10,000 population for Bengaluru Rural district. Calculated as `(rural_m_ct / mid_yr_pop_r) × 10,000`. |
| `tot_deaths_per_10k` | Numeric | Combined monthly mortality rate per 10,000 population across both districts. |
| `avg_max_temp` | Numeric | Average monthly maximum temperature (°C), calculated from daily maximum temperature observations. |
| `total_rain` | Numeric | Total monthly rainfall (mm), calculated by summing daily rainfall observations. |

---

## Data Sources

### Mortality Data

**Source:** Government of Karnataka – *Annual Report on the Registration of Births and Deaths Act, 1969*

Accessed through OpenCity:

https://data.opencity.in/dataset/bengaluru-annual-births-and-deaths-data

**Processing:**
- Monthly mortality counts were manually transcribed from annual government PDF reports.
- Mid-year population estimates were obtained from the corresponding reports.
- Monthly mortality rates per 10,000 population were calculated using the reported mid-year population estimates.

---

### Weather Data

**Source:** India Meteorological Department (IMD)

Accessed through OpenCity:

https://data.opencity.in/dataset/daily-temperature-70-years-data-for-major-indian-cities/resource/9cf80863-97ea-4ad8-a4ef-6a5f026debbb

**Processing:**
- Daily maximum temperature observations were averaged to produce monthly average maximum temperatures.
- Daily rainfall observations were summed to produce monthly rainfall totals.
- Data aggregation and cleaning were performed using the R script `data_cleaning.R`.

---

-  Weather and mortality datasets were merged by year and month to produce the final dataset.

---

## Notes

- Data from **2020–2022** were excluded because mortality patterns were substantially affected by the COVID-19 pandemic.
- Data from **2024** were excluded because weather observations were only available through June.
- Administrative boundaries changed in **2007** when Ramanagara district was created from Bengaluru Rural district. Population estimates after 2007 reflect the revised district boundaries reported by the Government of Karnataka.
- Bengaluru Urban and Bengaluru Rural are administrative districts. Each district contains both urban and rural populations, although the majority of the urban population resides within Bengaluru Urban district and the majority of the rural population resides within Bengaluru Rural district.
- The 2006 annual report contains an apparent inconsistency in the published mid-year population estimates for Bengaluru Urban and Bengaluru Rural. These values should be verified and are not included in this dataset.
