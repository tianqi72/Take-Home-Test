-- Create a column to determine whether life expectancy is declining or not
-- by calculating the difference between current row and next row
-- Get the ranking of each row within each country for later calculation
WITH ranked_data AS (
    SELECT
        entity AS country_name,
        year,
        life_expectancy,
        CASE WHEN LEAD(life_expectancy) OVER(PARTITION BY country_name ORDER BY year) - life_expectancy <= 0
                THEN True ELSE False 
                END AS decline,
        ROW_NUMBER() OVER (PARTITION BY entity ORDER BY year) AS overall_ranking
    FROM life_expectancy
)
-- Group by each interval and count the number of rows within each interval
SELECT 
    country_name, 
    MIN(year) interval_start_year,
    MAX(year) interval_end_year
FROM (
        -- Create ranking within each group, which is partitioned by a window function based on decline or not 
        -- If the difference between overall ranking and subgroup ranking is the same
        -- then the life expectancy within this group follows the same trend (increasing or decreasing)
        SELECT 
            *,
            ROW_NUMBER() OVER (PARTITION BY country_name, decline ORDER BY year) AS row_n,
            overall_ranking - row_n interval_id    
        FROM ranked_data
        ORDER BY country_name, year
    ) AS period
WHERE decline = True
GROUP BY country_name, interval_id
ORDER BY COUNT(*) DESC
LIMIT 1;