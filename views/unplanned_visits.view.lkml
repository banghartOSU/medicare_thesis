view: unplanned_visits {
  sql_table_name: tj_thesis_med.unplanned_visits ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(CAST(${measure_id} as STRING),CAST(${provider_id} as STRING)) ;;
  }

  parameter: test {
    type: string
    default_value: "City"
    suggest_dimension: city
  }

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: compared_to_national {
    type: string
    sql: ${TABLE}.Compared_to_National ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.County_Name ;;
  }

  dimension: denominator {
    type: number
    sql: CASE WHEN ${TABLE}.Denominator = "Not Available" THEN 0 ELSE CAST(${TABLE}.Denominator AS INT64) END ;;
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

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
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

  dimension: readmission_measure_names{
    type: string
    sql: CASE WHEN ${measure_name} LIKE "%return days%" THEN NULL ELSE ${measure_name} END ;;
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
    type: number
    sql: ${TABLE}.Provider_ID ;;
  }

  dimension: score {
    type: string
    sql: ${TABLE}.Score ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: lower_estimate{
    type: number
    sql: CASE WHEN ${TABLE}.Lower_Estimate = "Not Available" THEN 0.0 ELSE CAST(${TABLE}.Lower_Estimate as FLOAT64) END ;;
  }
  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZIP_Code ;;
  }

  ## LOWER ESTIMATE ##
  dimension: lower_estimate_count{
    hidden: yes
    type: number
    sql: CASE WHEN ${TABLE}.Lower_Estimate = "Not Available" THEN 0.0 ELSE (CAST(${TABLE}.Lower_Estimate as FLOAT64)/100)*${denominator} END ;;
  }
  measure: lower_estimate_sum {
    hidden: yes
    type: sum
    sql: ${lower_estimate_count} ;;
  }
  measure: lower_estimate_dynamic_percent {
    type: number
    sql: SAFE_DIVIDE(${lower_estimate_sum},${denominator_measure}) ;;
    value_format_name: percent_1
  }
  #####

  ## MED ESTIMATE ##
  dimension: score_estimate_count{
    hidden: yes
    type: number
    sql: CASE WHEN ${TABLE}.Score = "Not Available" THEN 0.0 ELSE (CAST(${TABLE}.Score as FLOAT64)/100)*${denominator} END ;;
  }
  measure: score_estimate_sum {
    hidden: yes
    type: sum
    sql: ${score_estimate_count} ;;
  }
  measure: score_estimate_dynamic_percent {
    type: number
    sql: SAFE_DIVIDE(${score_estimate_sum},${denominator_measure}) ;;
    value_format_name: percent_1
  }
  #####

  ## HIGH ESTIMATE ##
  dimension: higher_estimate_count{
    hidden: yes
    type: number
    sql: CASE WHEN ${TABLE}.Higher_Estimate = "Not Available" THEN 0.0 ELSE (CAST(${TABLE}.Higher_Estimate as FLOAT64)/100)*${denominator} END ;;
  }
  measure: higher_estimate_sum {
    hidden: yes
    type: sum
    sql: ${higher_estimate_count} ;;
  }
  measure: higher_estimate_dynamic_percent {
    type: number
    sql: SAFE_DIVIDE(${higher_estimate_sum},${denominator_measure}) ;;
    value_format_name: percent_1
  }
  #####

  measure: denominator_measure {
    type: sum
    sql: ${denominator};;
  }
  measure: count {
    type: count
    drill_fields: [county_name, measure_name, hospital_name]
  }
}
