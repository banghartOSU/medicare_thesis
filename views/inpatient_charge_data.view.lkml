explore: inpatient_charge_data {}

view: inpatient_charge_data {
  sql_table_name: tj_thesis_med.inpatient_charge_data ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${drg_definition},CAST(${provider_id} as STRING)) ;;
  }

  dimension: average_covered_charges {
    type: number
    sql: ${TABLE}.Average_Covered_Charges ;;
  }

  dimension: average_medicare_payments {
    type: number
    sql: ${TABLE}.Average_Medicare_Payments ;;
  }
  dimension: tier_test {
    type: tier
    style: interval
    tiers: [0,1000,2000]
    sql: ${average_medicare_payments} ;;

  }

  dimension: average_total_payments {
    type: number
    sql: ${TABLE}.Average_Total_Payments ;;
  }

  dimension: drg_definition {
    type: string
    sql: ${TABLE}.DRG_Definition ;;
    link: {
      label: "Select Inpatient Care"
      url: "https://productday.dev.looker.com/dashboards/424?Hospital Name={{_filters['general_info.hospital_name']}}&Region={{_filters['general_info.regional_granularity']}}&Demographic Metric={{_filters['fast_facts.measure_to_compare']}}&Inpatient Type={{value}}"
    }
    link: {
      label: "Google term"
      url: "https://www.google.com/search?q={{value}}"
    }
  }

  dimension: hospital_referral_region__hrr__description {
    type: string
    sql: ${TABLE}.Hospital_Referral_Region__HRR__Description ;;
  }

  dimension: provider_city {
    type: string
    sql: ${TABLE}.Provider_City ;;
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.Provider_Id ;;
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

  dimension: total_discharges {
    type: number
    sql: ${TABLE}.Total_Discharges ;;
  }
  measure: average_covered_charges_measure {
    type: average
    sql: ${TABLE}.Average_Covered_Charges ;;
    value_format_name: usd
  }

  measure: average_medicare_payments_measure {
    type: average
    sql: ${TABLE}.Average_Medicare_Payments ;;
    value_format_name: usd
  }

  measure: average_total_payments_measure {
    type: average
    sql: ${TABLE}.Average_Total_Payments ;;
    value_format_name: usd
  }

  measure: total_charges_measure {
    type: sum
    sql: ${total_discharges} ;;
  }

  measure: count {
    type: count
    drill_fields: [provider_name]
  }
}
