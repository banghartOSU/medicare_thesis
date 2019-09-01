view: death_and_complications {
  sql_table_name: tj_thesis_med.death_and_complications ;;

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
    sql: CASE WHEN ${TABLE}.Compared_to_National = "No Different Than the National Value" THEN "No Different Than the National Rate" ELSE ${TABLE}.Compared_to_National END ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.County_Name ;;
  }

  dimension: denominator {
    type: string
    sql: CASE WHEN ${TABLE}.Denominator = "Not Available" THEN 0 ELSE CAST(${TABLE}.Denominator as INT64) END ;;
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
    type: string
    sql: ${TABLE}.Score ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZIP_Code ;;
  }

  measure: count {
    type: count
    drill_fields: [county_name, measure_name, hospital_name]
  }
}
