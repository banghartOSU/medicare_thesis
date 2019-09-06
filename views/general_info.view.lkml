view: general_info {
  sql_table_name: tj_thesis_med.general_info ;;

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
    sql: ${TABLE}.County_Name ;;
  }

  dimension: effectiveness_of_care_national_comparison {
    type: string
    sql: ${TABLE}.Effectiveness_of_care_national_comparison ;;
    html: @{format_single_vis_dim} ;;
  }

  dimension: effectiveness_of_care_national_comparison_footnote {
    type: string
    sql: ${TABLE}.Effectiveness_of_care_national_comparison_footnote;;
  }

  dimension: efficient_use_of_medical_imaging_national_comparison {
    type: string
    sql: ${TABLE}.Efficient_use_of_medical_imaging_national_comparison ;;
    html: @{format_single_vis_dim} ;;
  }

  dimension: efficient_use_of_medical_imaging_national_comparison_footnote {
    type: string
    sql: ${TABLE}.Efficient_use_of_medical_imaging_national_comparison_footnote ;;
  }

  dimension: emergency_services {
    type: yesno
    sql: ${TABLE}.Emergency_Services ;;
  }

  dimension: hospital_name {
    type: string
    sql: ${TABLE}.Hospital_Name ;;
  }

  dimension: hospital_overall_rating {
    type: string
    sql: ${TABLE}.Hospital_overall_rating ;;
  }

  dimension: hospital_overall_rating_footnote {
    type: string
    sql: ${TABLE}.Hospital_overall_rating_footnote ;;
  }

  dimension: hospital_ownership {
    type: string
    sql: ${TABLE}.Hospital_Ownership ;;
  }

  dimension: hospital_type {
    type: string
    sql: ${TABLE}.Hospital_Type ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: meets_criteria_for_meaningful_use_of_ehrs {
    type: yesno
    sql: ${TABLE}.Meets_criteria_for_meaningful_use_of_EHRs ;;
  }

  dimension: mortality_national_comparison {
    type: string
    sql: ${TABLE}.Mortality_national_comparison ;;
    html: @{format_single_vis_dim} ;;
  }

  dimension: mortality_national_comparison_footnote {
    type: string
    sql: ${TABLE}.Mortality_national_comparison_footnote ;;
  }

  dimension: patient_experience_national_comparison {
    type: string
    sql: ${TABLE}.Patient_experience_national_comparison ;;
    html: @{format_single_vis_dim} ;;
  }

  dimension: patient_experience_national_comparison_footnote {
    type: string
    sql: ${TABLE}.Patient_experience_national_comparison_footnote ;;
  }

  dimension: phone_number {
    type: number
    sql: ${TABLE}.Phone_Number ;;
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.Provider_ID ;;
  }

  dimension: readmission_national_comparison {
    type: string
    sql: ${TABLE}.Readmission_national_comparison ;;
    html: @{format_single_vis_dim};;
  }

  dimension: readmission_national_comparison_footnote {
    type: string
    sql: ${TABLE}.Readmission_national_comparison_footnote ;;
  }

  dimension: safety_of_care_national_comparison {
    type: string
    sql: ${TABLE}.Safety_of_care_national_comparison ;;
    html: @{format_single_vis_dim} ;;
  }

  dimension: safety_of_care_national_comparison_footnote {
    type: string
    sql: ${TABLE}.Safety_of_care_national_comparison_footnote ;;
  }

  dimension: state {
    sql: ${TABLE}.State ;;
    map_layer_name: us_states
  }

  dimension: timeliness_of_care_national_comparison {
    type: string
    sql: ${TABLE}.Timeliness_of_care_national_comparison ;;
    html: @{format_single_vis_dim} ;;
  }

  dimension: timeliness_of_care_national_comparison_footnote {
    type: string
    sql: ${TABLE}.Timeliness_of_care_national_comparison_footnote ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: CAST(${TABLE}.ZIP_Code as string);;
    map_layer_name: us_zipcode_tabulation_areas
  }
#############################ONE TO MANY COMPARISON#########################################
  parameter: hospital_name_filter {
    description: "To be used only with Hospital Comparison"
    suggest_dimension: hospital_name
  }
  dimension: hospital_comparison {
    type: string
    sql:
    CASE WHEN {{hospital_name_filter._parameter_value}} = ${hospital_name}
      THEN ${hospital_name}
    ELSE 'REST OF POPULATION' END ;;
  }
  dimension: region_of_hospital_to_compare {

    type: string
    sql:
    CASE WHEN ${hospital_comparison} = {{hospital_name_filter._parameter_value}}
      THEN ${region_granularity_dim}
    ELSE NULL END  ;;
  }
  parameter: region_granularity {
    type: string
    allowed_value: {label:"State"     value: "State"   }
    allowed_value: {label:"City"      value: "City"    }
    allowed_value: {label:"County"    value: "County"  }
    allowed_value: {label:"Zip"       value: "Zip"     }
    allowed_value: {label:"National"  value: "National"}
  }
  dimension: region_param {
    sql: {{region_granularity._parameter_value}} ;;
  }
  dimension: region_granularity_dim {
    sql:
    {% if {{region_granularity._parameter_value}} == "'State'" %}
      ${state}
    {% elsif {{region_granularity._parameter_value}} == "'City'" %}
      ${city}
    {% elsif {{region_granularity._parameter_value}} == "'County'" %}
      ${county_name}
    {% elsif {{region_granularity._parameter_value}} == "'Zip'" %}
      ${zip_code}
    {% else %}
      "USA"
    {% endif %};;
  }
  measure: count {
    type: count
    drill_fields: [county_name, hospital_name]
  }
}
