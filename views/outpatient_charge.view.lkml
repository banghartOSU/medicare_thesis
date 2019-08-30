view: outpatient_charge {
  sql_table_name: tj_thesis_med.out_patient_charge ;;

  dimension: apc {
    type: number
    sql: ${TABLE}.APC ;;
  }

  dimension: apc_description {
    type: string
    sql: ${TABLE}.APC_Description ;;
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
    primary_key: yes
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
}
