view: payment_data_general {
  sql_table_name: tj_thesis_med.payment_data_general ;;
  dimension: primary_key {
    primary_key: yes
    type: string
    sql: CONCAT(CAST(${provider_id} as STRING),${payment_measure_name}) ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.County_name ;;
  }

  dimension: denominator {
    type: number
    sql: CASE WHEN ${TABLE}.Denominator = "Not Available" THEN 0 ELSE CAST(${TABLE}.Denominator as INT64) END ;;
  }

  dimension: higher_estimate {
    type: string
    sql: ${TABLE}.Higher_estimate ;;
  }

  dimension: hospital_name {
    type: string
    sql: ${TABLE}.Hospital_name ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: lower_estimate {
    type: string
    sql: ${TABLE}.Lower_estimate ;;
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
    sql: ${TABLE}.Measure_start_date ;;
  }

  dimension: payment {
    type: string
    sql: ${TABLE}.Payment ;;
  }

  dimension: payment_category {
    type: string
    sql: ${TABLE}.Payment_category ;;
  }

  dimension: payment_footnote {
    type: string
    sql: ${TABLE}.Payment_footnote ;;
  }

  dimension: payment_measure_id {
    type: string
    sql: ${TABLE}.Payment_measure_ID ;;
  }

  dimension: payment_measure_name {
    type: string
    sql: ${TABLE}.Payment_measure_name ;;
  }

  dimension: phone_number {
    type: number
    sql: ${TABLE}.Phone_number ;;
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.Provider_ID ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: value_of_care_category {
    type: string
    sql: ${TABLE}.Value_of_care_category ;;
  }

  dimension: value_of_care_display_id {
    type: string
    sql: ${TABLE}.Value_of_care_display_ID ;;
  }

  dimension: value_of_care_display_name {
    type: string
    sql: ${TABLE}.Value_of_care_display_name ;;
  }

  dimension: value_of_care_footnote {
    type: string
    sql: ${TABLE}.Value_of_care_footnote ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.ZIP_Code ;;
  }
  measure: denominator_measure {
    type: number
    sql: SUM(${denominator})/${count} ;;
  }
  measure: count {
    type: count
    drill_fields: [payment_measure_name, value_of_care_display_name, county_name, hospital_name]
  }
}
