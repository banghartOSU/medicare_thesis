view: state_death_complication_measures {
  derived_table: {
    sql:
    SELECT
  bq_logrecno_bg_map.stusab AS bq_logrecno_bg_map_stusab,
  death_and_complications.Measure_ID  AS death_and_complications_measure_id,
  death_and_complications.Measure_Name  AS death_and_complications_measure_name,

      ((COALESCE(SUM(block_group_facts.aggregate_income ), 0))/NULLIF((COALESCE(SUM(block_group_facts.housing_units ), 0)), 0))
     AS block_group_facts_measure_selector,
  CASE WHEN (CASE WHEN death_and_complications.Measure_ID LIKE "%PSI_3%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_6%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_8%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_9%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_10%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_11%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_12%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_13%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_14%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_15%"
    THEN death_and_complications.Measure_Name
    ELSE NULL END) IS NOT NULL
      THEN (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(CASE WHEN (((CASE WHEN death_and_complications.Measure_ID LIKE "%PSI_3%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_6%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_8%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_9%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_10%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_11%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_12%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_13%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_14%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_15%"
    THEN death_and_complications.Measure_Name
    ELSE NULL END) IS NOT NULL)) THEN (CASE WHEN death_and_complications.Score = "Not Available"
      THEN 0
    ELSE CAST(death_and_complications.Score AS FLOAT64) END)  ELSE NULL END,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN (((CASE WHEN death_and_complications.Measure_ID LIKE "%PSI_3%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_6%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_8%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_9%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_10%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_11%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_12%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_13%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_14%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_15%"
    THEN death_and_complications.Measure_Name
    ELSE NULL END) IS NOT NULL)) THEN CONCAT(death_and_complications.Measure_Name,CAST(death_and_complications.Provider_ID as string))  ELSE NULL END AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN (((CASE WHEN death_and_complications.Measure_ID LIKE "%PSI_3%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_6%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_8%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_9%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_10%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_11%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_12%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_13%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_14%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_15%"
    THEN death_and_complications.Measure_Name
    ELSE NULL END) IS NOT NULL)) THEN CONCAT(death_and_complications.Measure_Name,CAST(death_and_complications.Provider_ID as string))  ELSE NULL END AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN (((CASE WHEN death_and_complications.Measure_ID LIKE "%PSI_3%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_6%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_8%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_9%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_10%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_11%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_12%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_13%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_14%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_15%"
    THEN death_and_complications.Measure_Name
    ELSE NULL END) IS NOT NULL)) THEN CONCAT(death_and_complications.Measure_Name,CAST(death_and_complications.Provider_ID as string))  ELSE NULL END AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(CASE WHEN (((CASE WHEN death_and_complications.Measure_ID LIKE "%PSI_3%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_6%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_8%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_9%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_10%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_11%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_12%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_13%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_14%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_15%"
    THEN death_and_complications.Measure_Name
    ELSE NULL END) IS NOT NULL)) THEN CONCAT(death_and_complications.Measure_Name,CAST(death_and_complications.Provider_ID as string))  ELSE NULL END AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0))
    ELSE (ROUND(SUM((CASE WHEN (CASE WHEN lower(death_and_complications.Measure_Name) LIKE '%rate%'
        THEN death_and_complications.Measure_Name
      ELSE NULL END) IS NULL AND (CASE WHEN death_and_complications.Measure_ID LIKE "%PSI_3%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_6%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_8%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_9%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_10%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_11%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_12%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_13%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_14%"
          OR  death_and_complications.Measure_ID LIKE "%PSI_15%"
    THEN death_and_complications.Measure_Name
    ELSE NULL END) IS NOT NULL
      THEN (CASE WHEN death_and_complications.Score = "Not Available"
      THEN 0
    ELSE CAST(death_and_complications.Score AS FLOAT64) END)
    ELSE CEILING(((CASE WHEN death_and_complications.Score = "Not Available"
      THEN 0
    ELSE CAST(death_and_complications.Score AS FLOAT64) END)/100)*(CASE WHEN death_and_complications.Denominator = "Not Available"
        THEN 0
      ELSE CAST(death_and_complications.Denominator as INT64) END)) END))/SUM(NULLIF((CASE WHEN death_and_complications.Denominator = "Not Available"
        THEN 0
      ELSE CAST(death_and_complications.Denominator as INT64) END),0))*100,2)) END AS death_and_complications_respective_scores
FROM `lookerdata.looker_scratch.LR_GM73WSJ8N7N6IZ5TZ41RF_bq_logrecno_bg_map` AS bq_logrecno_bg_map
LEFT JOIN `looker-datablocks.acs_fast_facts.fast_facts`  AS block_group_facts ON (SUBSTR(bq_logrecno_bg_map.geoid, 8, 12)) = block_group_facts.logrecno_bg_map_block_group
LEFT JOIN `lookerdata.looker_scratch.LR_GMB8TM8H40CSOPURX79HG_bq_tract_zcta_map` AS tract_zcta_map ON bq_logrecno_bg_map.geoid11 = tract_zcta_map.geoid
LEFT JOIN tj_thesis_med.general_info  AS general_info ON (LPAD(CAST(tract_zcta_map.ZCTA5 as STRING), 5, '0')) = (CAST(general_info.ZIP_Code as string))
LEFT JOIN tj_thesis_med.death_and_complications  AS death_and_complications ON general_info.Provider_ID = death_and_complications.Provider_ID

WHERE
  (death_and_complications.Measure_Name = 'Death rate for heart failure patients')
GROUP BY 1,2,3
ORDER BY 4 DESC
LIMIT 500;;
  }

dimension: respective_scores {
  type: number
  sql:${TABLE}.death_and_complications_respective_scores;;
}
dimension: measure_selector {
  type: number
  sql: block_group_facts_measure_selector ;;
}

}
