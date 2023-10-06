---
title: Life Expectancy Insights & Business Opportunity
---

# Background
## Why This Analysis
- Gain a deeper understanding of the company's strategic position.
- Help refine strategies and prioritize resources.
## Overview
- Assessment of the company's internal strengths and weaknesses as well as external opportunities and threats.
- Focus on opportunities with data driven insights from life expectancy research.

# Strengths to Maximize
- Pioneering in Psychedelic Medicine
- Innovative approach
# Weakness to Minimize
- Brand recognition
- Research related difficulties
# Threats
- Competition
- Stigma around seeking mental health assistance
# Opportunities
## The progress in economics and technology lay foundation

<Details title="Definition">
“life expectancy” refers to the number of years a person can expect to live. 
</Details>

- Life expectancy has been rising around the world.
- Economic growth and technological advancements serves as a robust underpinning for the pursuit of mental health.

<LineChart
  data={world_by_year}
  x=year
  y=life_expectancy
  series=country
  yMin=20
  yMax=90
  yAxisTitle="Age"
  xAxisTitle='Year'
  title = "Worldwide Life Expectancy Trend"
/>

```sql world_by_year
SELECT
  entity as country, year, life_expectancy
FROM life_expectancy
WHERE entity IN ('Oceania', 'Europe', 'Americas', 'Asia', 'Africa')
AND year>=1950
ORDER BY year
```

## Research has unveiled the increasing importance of mental health.
- Mental and physical health are equally important components of overall health.
- Mental health affects life expectancy.

<BigValue 
    data={life_reduction}
    value='life_expectancy' 
    comparison='diff'
    comparisonFmt='pct'
    downisGood=True
    comparisonTitle='Than Smoking'
    title='Reduced Life Expectancy by Mental Illness'
/>

```sql life_reduction
SELECT
  '10 - 25 years' as life_expectancy,
  0.5 as diff
```

<ScatterPlot 
    data={corr_developed} 
    y=life_expectancy
    x=score
    yFmt='num1'
    xAxisTitle="Depression Rate (%)" 
    yAxisTitle="Life Expectancy" 
    title='Life Expectancy vs. Depression Rate in Developed Countries (2017)'
/>

```sql corr_developed
/* Add external data depression rate in 2017 */
SELECT CASE WHEN entity='Australia' THEN 5.9 WHEN entity='United Kingdom' THEN 4.5
WHEN entity='Greece' THEN 5.7 WHEN entity='Japan' THEN 4.2
WHEN entity= 'Estonia' THEN 5.9 WHEN entity='Switzerland' THEN 5
WHEN entity='Iceland' THEN 4.1 WHEN entity='Germany' THEN 5.2
WHEN entity='Sweden' THEN 4.9 WHEN entity='Finland' THEN 5.6 
WHEN entity='New Zealand' THEN 5.4 WHEN entity='Canada' THEN 4.7
WHEN entity='Singapore' THEN 4.6 WHEN entity='South Korea' THEN 4.1
WHEN entity='Norway' THEN 4.7 WHEN entity='Netherlands' THEN 4.7
WHEN entity='Denmark' THEN 5 WHEN entity='Luxembourg' THEN 5 END AS score,
entity, life_expectancy
FROM life_expectancy
WHERE year=2017 AND score IS NOT NULL
```

## The present circumstances present a prime opportunity.
- Global pandemic significantly affected mental wellbeing.
- It is an opportunity to shine a spotlight on mental health.

### Conditions After COVID-19
<BigValue 
    data={distress}
    value='score' 
    comparison='diff'
    comparisonFmt='pct'
    downisGood=True
    title='% Struggling'
    comparisonTitle='Than 2019'
/>
<BigValue 
    data={depression}
    value='score' 
    title='Depression (U.S.)'
/>
<BigValue 
    data={suicide}
    value='score' 
    title='Indivisual with Suicidal ideation (U.S.)'
/>

```sql distress
SELECT '30%' AS score, 1.14 AS diff
```

```sql depression
SELECT '39%' AS score
```

```sql suicide
SELECT 516372 AS score
```

<LineChart
  data={covid}
  x=year
  y=life_expectancy
  yAxisTitle='Age'
  series=country
  yMin = 70
  title = "Worldwide Life Expectancy Trend"
>
<ReferenceArea xMin='2020' xMax='2022' label='COVID-19' color=yellow labelPosition=right/>
</LineChart>

```sql covid
SELECT
  entity as country, year,
  life_expectancy
FROM life_expectancy
WHERE entity IN ('Oceania', 'Europe', 'Americas', 'Asia', 'Africa') 
AND year>=2016
ORDER BY year
```
## Consumer segments exhibit distinct variations. 
- Female has higher life expectancy.
- Young adults has the highest prevalence of serious mental illness. 
- The prevalence of any mental illness is highest among adults with multiple ethnicities. 

<BarChart 
    data={gender} 
    swapXY=true 
    x=entity 
    y=life 
    yFmt='num0'
    series=sex 
    type=grouped 
    xType=category
    yAxisTitle='Age'
    title='Life Expectancy by Sex (2021)'
/>

```sql gender
(SELECT entity, 'Male' AS sex,
CASE WHEN entity='United Kingdom' THEN 78.7
WHEN entity='United States' THEN 74.3
END AS life
FROM life_expectancy
WHERE year=2021 AND entity IN ('United States', 'United Kingdom'))
UNION
(SELECT entity, 'Female' AS sex,
CASE WHEN entity='United Kingdom' THEN 82.8
WHEN entity='United States' THEN 80.2
END AS life
FROM life_expectancy
WHERE year=2021 AND entity IN ('United States', 'United Kingdom'))
```

<BarChart 
    data={age} 
    x=age
    y=rate 
    yFmt='pct1'
    xAxisTitle='Age'
    yAxisTitle='Rate'
    title='Prevalence of Serious Mental Illness in U.S. (2021)'
/>

```sql age
SELECT '18-25' AS age, 0.114 as rate
UNION 
SELECT '26-49' AS age, 0.071 as rate
UNION 
SELECT '50+' AS age, 0.025 as rate
```

<BarChart 
    data={race} 
    x=race
    y=rate
    yFmt='pct1'
    xAxisTitle='Race/Ethnicity'
    yAxisTitle='Rate'
    swapXY=true
    title='Prevalence of Any Mental Illness in U.S. (2021)'
/>

```sql race
SELECT 'Hispanic' AS race, 0.207 as rate
UNION 
SELECT 'White' AS race, 0.239 as rate
UNION 
SELECT 'Black or African American' AS race, 0.214 as rate
UNION 
SELECT 'NH/OPI' AS race, 0.181 as rate
UNION 
SELECT 'AI/AN' AS race, 0.266 as rate
UNION 
SELECT 'Asian' AS race, 0.164 as rate
UNION 
SELECT 'Two or More' AS race, 0.349 as rate
```

<Details title="Definition">
Persons of Hispanic origin may be of any race; all other racial/ethnic groups are non-Hispanic. 

NH/OPI = Native Hawaiian / Other Pacific Islander. 
AI/AN = American Indian / Alaskan Native.
</Details>

# Recommendations
- Raise mental well-being awareness and brand awareness.
- Utilize benchmarking to identify unique selling propositions.
- Segment the market. 


<Details title="References">

- Life Expectancy. 2019. https://ourworldindata.org/life-expectancy#

- Fiorillo, A., Sartorius, N. Mortality gap and physical comorbidity of people with severe mental disorders: the public health scandal. Ann Gen Psychiatry 20, 52 (2021). https://doi.org/10.1186/s12991-021-00374-y

- The Mental State of the World in 2022. 2023. https://mentalstateoftheworld.report/wp-content/uploads/2023/02/Mental-State-of-the-World-2022.pdf

- The Implications of COVID-19 for Mental Health and Substance Use. 2023. https://www.kff.org/mental-health/issue-brief/the-implications-of-covid-19-for-mental-health-and-substance-use/

- Depression and Other Common Mental Disorders. https://worldpopulationreview.com/country-rankings/depression-rates-by-country

- Many mental illnesses reduce life expectancy more than heavy smoking. 2014. https://www.ox.ac.uk/news/2014-05-23-many-mental-illnesses-reduce-life-expectancy-more-heavy-smoking#:~:text=Serious%20mental%20illnesses%20reduce%20life,than%20that%20for%20heavy%20smoking.

- https://www.nimh.nih.gov/health/statistics/mental-illness

</Details>