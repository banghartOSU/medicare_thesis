connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "/views/**/*.view"
include: "//tj_thesis_demographics/datablocks-acs/bigquery.explore.lkml"

datagroup: tj_thesis_med_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: tj_thesis_med_default_datagroup

explore: outpatient_survey {
  join: general_info {
    type: inner
    relationship: one_to_one
    sql_on: ${outpatient_survey.facility_name} = ${general_info.hospital_name} ;;
  }
}
explore: outpatient_compare {

  join: general_info {
    sql_on: ${general_info.provider_id} = ${outpatient_compare.provider_id} ;;
    relationship: one_to_many
    type: left_outer
    fields: []
  }
}

explore: general_info {
  join: spending_by_claim {
    type: left_outer
    relationship: one_to_many
    sql_on: ${general_info.provider_id} = ${spending_by_claim.provider_id} ;;
  }
  join: spending_per_patient {
    type: left_outer
    relationship: one_to_many
    sql_on: ${general_info.provider_id} = ${spending_per_patient.provider_id} ;;
  }
  join: structural_measures {
    type: left_outer
    relationship: one_to_one
    sql_on: ${structural_measures.provider_id} = ${general_info.provider_id} ;;
  }
  join: outpatient_compare {
    type: left_outer
    relationship: one_to_many
    sql_on: ${outpatient_compare.provider_id} = ${general_info.provider_id} ;;
  }
  join: outpatient_charge {
    type: left_outer
    relationship: one_to_many
    sql_on: ${general_info.provider_id} = ${outpatient_charge.provider_id} ;;
  }
  join: death_and_complications {
    type: left_outer
    relationship: one_to_many
    sql_on: ${general_info.provider_id} = ${death_and_complications.provider_id} ;;
  }
}
