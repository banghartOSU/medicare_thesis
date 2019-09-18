view: spending_by_claim {
  sql_table_name: tj_thesis_med.spending_by_claim ;;

  dimension: avg_spending_per_episode_hospital {
    type: number
    sql: ${TABLE}.Avg_Spending_Per_Episode_Hospital ;;
  }

  dimension: avg_spending_per_episode_nation {
    type: number
    sql: ${TABLE}.Avg_Spending_Per_Episode_Nation ;;
  }

  dimension: avg_spending_per_episode_state {
    type: number
    sql: ${TABLE}.Avg_Spending_Per_Episode_State ;;
  }

  dimension: claim_type {
    type: string
    sql: ${TABLE}.Claim_Type ;;
  }
  dimension: end_date {
    type: number
    sql: ${TABLE}.End_Date ;;
  }

  dimension: hospital_name {
    type: string
    sql: ${TABLE}.Hospital_Name ;;
  }

  dimension: percent_of_spending_hospital {
    type: number
    sql: ${TABLE}.Percent_of_Spending_Hospital ;;
  }
  measure: percent_of_spending_hospital_measure {
    type: sum
    sql: ${percent_of_spending_hospital};;
    value_format_name: percent_2
  }

  dimension: percent_of_spending_nation {
    type: number
    sql: ${TABLE}.Percent_of_Spending_Nation ;;
  }

  dimension: percent_of_spending_state {
    type: number
    sql: ${TABLE}.Percent_of_Spending_State ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: CONCAT(CAST(${provider_id} AS STRING),${period},${claim_type}) ;;
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.Provider_ID ;;
  }

  dimension: start_date {
    type: number
    sql: ${TABLE}.Start_Date ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  measure: count {
    type: count
    drill_fields: [hospital_name]
  }
}
