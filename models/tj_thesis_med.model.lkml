connection: "lookerdata_publicdata_standard_sql"

include: "/views/**/*.view"
include: "//tj_thesis_demographics/datablocks-acs/bigquery.explore.lkml"
include: "//tj_thesis_demographics/datablocks-acs/zipcode_to_latlong_crosswalk.view"

datagroup: tj_thesis_med_default_datagroup {
  max_cache_age: "1000 hours"
  sql_trigger: SELECT 1 ;;
}

persist_with: tj_thesis_med_default_datagroup

explore: test {
  view_name: outpatient_survey
  persist_with: tj_thesis_med_default_datagroup
}
##

explore: demographics_death_and_facility {
  extends: [fast_facts,general_info]
  join: general_info {
    type: left_outer
    relationship: one_to_one
    sql_on: ${tract_zcta_map.ZCTA5} = ${general_info.zip_code} ;;
  }
}

explore: zip_to_location {
  extends: [fast_facts]
  join: zipcode_to_latlong_crosswalk {
    type: left_outer
    relationship: one_to_one
    sql_on: ${tract_zcta_map.ZCTA5} = ${zipcode_to_latlong_crosswalk.zipcode} ;;
  }
}

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

explore: charge_data {
  extends: [fast_facts]
  join: general_info {
    type: left_outer
    relationship: one_to_one
    sql_on: ${tract_zcta_map.ZCTA5} = ${general_info.zip_code} ;;
  }
  join: outpatient_charge {
    sql_on: ${general_info.provider_id} = ${outpatient_charge.provider_id} ;;
    type: inner
    relationship: one_to_many
  }
  join: inpatient_charge_data {
    sql_on: ${inpatient_charge_data.provider_id} = ${general_info.provider_id} ;;
    type: inner
    relationship: one_to_many
  }
  join: payment_data_general {
    sql_on: ${general_info.provider_id} = ${payment_data_general.provider_id} ;;
    type: left_outer
    relationship: one_to_many
  }
  join: unplanned_visits {
    sql_on: ${unplanned_visits.provider_id} = ${general_info.provider_id} ;;
    type: left_outer
    relationship: one_to_many
  }
}

explore: general_info {
  sql_always_where: ${general_info.state} IS NOT NULL ;;
  join: spending_by_claim {
    type: left_outer
    relationship: one_to_one
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
  join: average_by_apc {
    sql_on: ${average_by_apc.apc_description} = ${outpatient_charge.apc_description} ;;
    relationship: one_to_one
    type: inner
  }
  join: death_and_complications {
    type: left_outer
    relationship: one_to_one
    sql_on: ${general_info.provider_id} = ${death_and_complications.provider_id} ;;
  }
}
