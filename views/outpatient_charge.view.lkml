view: outpatient_charge {
  sql_table_name: tj_thesis_med.out_patient_charge ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(CAST(${provider_id} AS STRING), CAST(${apc} AS STRING))  ;;
  }

  dimension: apc {
    type: number
    sql: ${TABLE}.APC ;;
  }

  dimension: apc_description {
    type: string
    sql: ${TABLE}.APC_Description ;;
    link: {
      label: "Choose Outpatient Charge"
      url: "https://productday.dev.looker.com/dashboards/406?County={{_filters['general_info.county_name']}}&Hospital Name={{_filters['general_info.hospital_name_filter']}}&Outpatient Procedure={{value}}"
    }
  }
  dimension: apc_description_no_link {
    type: string
    sql: ${TABLE}.APC_Description ;;
    drill_fields: [apc_description]
  }

  dimension: average_estimated_total_submitted_charges {
    type: number
    sql: CAST(${TABLE}.Average_Estimated_Total_Submitted_Charges as INT64) ;;
  }
  dimension: average_medicare_allowed_amount {
    type: number
    sql: CAST(${TABLE}.Average_Medicare_Allowed_Amount as INT64) ;;
  }

  dimension: average_medicare_outlier_amount {
    type: number
    sql: CAST(${TABLE}.Average_Medicare_Outlier_Amount as INT64);;
  }

  dimension: average_medicare_payment_amount {
    type: number
    sql: CAST(${TABLE}.Average_Medicare_Payment_Amount as INT64);;
  }
  dimension: comprehensive_apc_services {
    type: number
    sql: ${TABLE}.Comprehensive_APC_Services ;;
  }

  dimension: outlier_comprehensive_apc_services {
    type: number
    sql: ${TABLE}.Outlier_Comprehensive_APC_Services ;;
  }

  dimension: provider_city {
    type: string
    sql: ${TABLE}.Provider_City ;;
  }

  dimension: provider_hrr {
    type: string
    sql: ${TABLE}.Provider_HRR ;;
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.Provider_ID ;;
  }

  dimension: provider_name {
    type: string
    sql: ${TABLE}.Provider_Name ;;
  }

  dimension: provider_state {
    type: string
    sql: ${TABLE}.Provider_State ;;
  }

  dimension: provider_street_address {
    type: string
    sql: ${TABLE}.Provider_Street_Address ;;
  }

  dimension: provider_zip_code {
    type: number
    sql: ${TABLE}.Provider_Zip_Code ;;
  }

  measure: count {
    type: count
    drill_fields: [provider_name]
  }
  measure: average_estimated_total_submitted_charges_measure {
    type: average
    sql: ${average_estimated_total_submitted_charges} ;;
    value_format_name: usd
    drill_fields: [general_info.hospital_name,average_estimated_total_submitted_charges_measure]
  }
  measure: average_medicare_payment_amount_measure {
    type: average
    sql: ${average_medicare_payment_amount} ;;
    value_format_name: usd
  }
}
#NDT example
view: average_by_apc{
  derived_table: {
    explore_source: general_info {
      column: average_medicare_payment_amount_measure { field: outpatient_charge.average_medicare_payment_amount_measure }
      column: apc_description { field: outpatient_charge.apc_description }
    }
  }
  dimension: average_medicare_payment_amount_measure {
    value_format: "$#,##0.00"
    type: number
  }
  dimension: apc_description {hidden: yes}
}
