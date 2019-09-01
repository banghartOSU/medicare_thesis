view: outpatient_survey {
  sql_table_name: tj_thesis_med.outpatient_survey ;;

  dimension: _cms_certification_number {
    type: number
    sql: ${TABLE}._CMS_Certification_Number ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: communication_about_your_procedure_linear_mean_score {
    type: number
    sql: ${TABLE}.Communication_about_your_procedure_linear_mean_score ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: facilities_and_staff_linear_mean_score {
    type: number
    sql: ${TABLE}.Facilities_and_staff_linear_mean_score ;;
  }

  dimension: facility_name {
    type: string
    sql: ${TABLE}.Facility_Name ;;
  }

  dimension: footnote {
    type: string
    sql: ${TABLE}.Footnote ;;
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
    sql: ${TABLE}.Measure_Start_Date ;;
  }

  dimension: number_of_completed_surveys {
    type: number
    sql: ${TABLE}.Number_of_Completed_Surveys ;;
  }

  dimension: number_of_sampled_patients {
    type: number
    sql: ${TABLE}.Number_of_Sampled_Patients ;;
  }

  dimension: patients____rating_of_the_facility_linear_mean_score {
    type: number
    sql: ${TABLE}.Patients____rating_of_the_facility_linear_mean_score ;;
  }

  dimension: patients_recommending_the_facility_linear_mean_score {
    type: number
    sql: ${TABLE}.Patients_recommending_the_facility_linear_mean_score ;;
  }

  dimension: patients_who_gave_the_facility_a_rating_of_0_to_6_on_a_scale_from_0__lowest__to_10__highest_ {
    type: number
    sql: ${TABLE}.Patients_who_gave_the_facility_a_rating_of_0_to_6_on_a_scale_from_0__lowest__to_10__highest_ ;;
  }

  dimension: patients_who_gave_the_facility_a_rating_of_7_or_8_on_a_scale_from_0__lowest__to_10__highest_ {
    type: number
    sql: ${TABLE}.Patients_who_gave_the_facility_a_rating_of_7_or_8_on_a_scale_from_0__lowest__to_10__highest_ ;;
  }

  dimension: patients_who_gave_the_facility_a_rating_of_9_or_10_on_a_scale_from_0__lowest__to_10__highest_ {
    type: number
    sql: ${TABLE}.Patients_who_gave_the_facility_a_rating_of_9_or_10_on_a_scale_from_0__lowest__to_10__highest_ ;;
  }

  dimension: patients_who_reported_no__they_would_not_recommend_the_facility_to_family_or_friends {
    type: number
    sql: ${TABLE}.Patients_who_reported_NO__they_would_not_recommend_the_facility_to_family_or_friends ;;
  }

  dimension: patients_who_reported_probably_yes_they_would_recommend_the_facility_to_family_or_friends {
    type: number
    sql: ${TABLE}.Patients_who_reported_PROBABLY_YES_they_would_recommend_the_facility_to_family_or_friends ;;
  }

  dimension: patients_who_reported_that_staff_definitely_communicated_about_what_to_expect_during_and_after_the_procedure {
    type: number
    sql: ${TABLE}.Patients_who_reported_that_staff_definitely_communicated_about_what_to_expect_during_and_after_the_procedure ;;
  }

  dimension: patients_who_reported_that_staff_definitely_gave_care_in_a_professional_way_and_the_facility_was_clean {
    type: number
    sql: ${TABLE}.Patients_who_reported_that_staff_definitely_gave_care_in_a_professional_way_and_the_facility_was_clean ;;
  }

  dimension: patients_who_reported_that_staff_did_not_communicate_about_what_to_expect_during_and_after_the_procedure {
    type: number
    sql: ${TABLE}.Patients_who_reported_that_staff_did_not_communicate_about_what_to_expect_during_and_after_the_procedure ;;
  }

  dimension: patients_who_reported_that_staff_did_not_give_care_in_a_professional_way_or_the_facility_was_not_clean {
    type: number
    sql: ${TABLE}.Patients_who_reported_that_staff_did_not_give_care_in_a_professional_way_or_the_facility_was_not_clean ;;
  }

  dimension: patients_who_reported_that_staff_somewhat_communicated_about_what_to_expect_during_and_after_the_procedure {
    type: number
    sql: ${TABLE}.Patients_who_reported_that_staff_somewhat_communicated_about_what_to_expect_during_and_after_the_procedure ;;
  }

  dimension: patients_who_reported_that_staff_somewhat_gave_care_in_a_professional_way_or_the_facility_was_somewhat_clean {
    type: number
    sql: ${TABLE}.Patients_who_reported_that_staff_somewhat_gave_care_in_a_professional_way_or_the_facility_was_somewhat_clean ;;
  }

  dimension: patients_who_reported_yes_they_would_definitely_recommend_the_facility_to_family_or_friends {
    type: number
    sql: ${TABLE}.Patients_who_reported_YES_they_would_DEFINITELY_recommend_the_facility_to_family_or_friends ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: survey_response_rate_percent {
    type: number
    sql: ${TABLE}.Survey_Response_Rate_Percent ;;
  }

  dimension: telephone {
    type: number
    sql: ${TABLE}.Telephone ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }

  measure: count {
    type: count
    drill_fields: [facility_name]
  }
}
