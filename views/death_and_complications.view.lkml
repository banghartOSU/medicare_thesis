view: death_and_complications {
  sql_table_name: tj_thesis_med.death_and_complications ;;

  ##For county level drill down
  parameter: county_parameter {
    hidden: no
    type: number
    suggest_dimension: zip_code
  }
  dimension: get_hospitals_in_county {
    type: string
    sql: CASE WHEN {{county_parameter._parameter_value}} = ${zip_code} THEN ${hospital_name} ELSE NULL END ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: test {
    sql: LOWER(${city}) ;;
  }
  dimension: compared_to_national {
    type: string
    sql:
      CASE WHEN ${TABLE}.Compared_to_National = "No Different Than the National Value"
        THEN "No Different Than the National Rate"
      ELSE ${TABLE}.Compared_to_National END ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.County_Name ;;
    link: {
      label: "Select Hospital"
      url: "https://productday.dev.looker.com/dashboards/406?County={{bq_logrecno_bg_map.county._value}}"
    }
  }

  dimension: denominator {
    type: string
    sql:
      CASE WHEN ${TABLE}.Denominator = "Not Available"
        THEN 0
      ELSE CAST(${TABLE}.Denominator as INT64) END ;;
  }

  dimension: footnote {
    type: string
    sql: ${TABLE}.Footnote ;;
  }

  dimension: higher_estimate {
    type: string
    sql: ${TABLE}.Higher_Estimate ;;
  }

  dimension: hospital_name {
    type: string
    sql: ${TABLE}.Hospital_Name ;;
  }

  dimension: lower_estimate {
    type: string
    sql: ${TABLE}.Lower_Estimate ;;
  }

  dimension_group: measure_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Measure_End_Date ;;
  }

  dimension: measure_id {
    type: string
    sql: ${TABLE}.Measure_ID ;;
  }

  dimension: measure_name {
    type: string
    sql: ${TABLE}.Measure_Name ;;
  }
  dimension: rates {
    type: string
    sql:
      CASE WHEN lower(${measure_name}) LIKE '%rate%'
        THEN ${measure_name}
      ELSE NULL END ;;
  }
  dimension: composite_measures {
    type: string
    sql:
    CASE WHEN ${measure_id} LIKE "%PSI_3%"
          OR  ${measure_id} LIKE "%PSI_6%"
          OR  ${measure_id} LIKE "%PSI_8%"
          OR  ${measure_id} LIKE "%PSI_9%"
          OR  ${measure_id} LIKE "%PSI_10%"
          OR  ${measure_id} LIKE "%PSI_11%"
          OR  ${measure_id} LIKE "%PSI_12%"
          OR  ${measure_id} LIKE "%PSI_13%"
          OR  ${measure_id} LIKE "%PSI_14%"
          OR  ${measure_id} LIKE "%PSI_15%"
    THEN ${measure_name}
    ELSE NULL END ;;
  }
  dimension: occurances_of_complication_or_death {
    type: number
    sql:
    CASE WHEN ${rates} IS NULL AND ${composite_measures} IS NOT NULL
      THEN ${score}
    ELSE CEILING((${score}/100)*${denominator}) END ;;
  }
  dimension_group: measure_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Measure_Start_Date ;;
  }

  dimension: phone_number {
    type: number
    sql: ${TABLE}.Phone_Number ;;
  }

  dimension: provider_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Provider_ID ;;
  }

  dimension: score {
    type: number
    sql:
    CASE WHEN ${TABLE}.Score = "Not Available"
      THEN 0
    ELSE CAST(${TABLE}.Score AS FLOAT64) END ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
    map_layer_name: us_states
    link: {
      label: "State Level"
      url: "https://productday.dev.looker.com/dashboards/404?State={{value}}&Complication={{measure_name._value}}"
    }
  }
  dimension: zip_code {
    type: zipcode
    sql: CAST(${TABLE}.ZIP_Code AS STRING) ;;
    map_layer_name: us_zipcode_tabulation_areas
  }
  measure: count {
    type: count
    drill_fields: [county_name, measure_name, hospital_name]
  }
  measure: respective_scores {
    type: number
    sql:
    CASE WHEN ${composite_measures} IS NOT NULL
      THEN ${composite_measure_sum}/${count}
    ELSE ${percentage_rate} END;;
    value_format: "[<0.5]0.00%;0.00"
  }
  measure: composite_measure_sum {
    type: sum_distinct
    sql_distinct_key: CONCAT(${measure_name},CAST(${provider_id} as string)) ;;
    sql: ${score} ;;
    filters: {
      field: composite_measures
      value: "-NULL"
    }
  }
  measure: percentage_rate {
    type: number
    sql: SUM(${occurances_of_complication_or_death})/SUM(NULLIF(${denominator},0));;
    }
}
