view: outpatient_compare {
  sql_table_name: tj_thesis_med.outpatient_compare ;;

  dimension: cardiovascular {
    type: number
    sql: CASE WHEN ${TABLE}.Cardiovascular = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Cardiovascular as INT64) END;;
  }

  dimension: eye {
    type: number
    sql: CASE WHEN ${TABLE}.Eye = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Eye as INT64) END;;
  }


  dimension: footnote {
    type: string
    sql: ${TABLE}.Footnote ;;
  }

  dimension: gastrointestinal {
    type: number
    sql:CASE WHEN ${TABLE}.Gastrointestinal = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Gastrointestinal as INT64) END ;;
  }

  dimension: genitourinary {
    type: number
    sql: CASE WHEN ${TABLE}.Genitourinary = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Genitourinary as INT64) END ;;
  }

  dimension: hospital_name {
    type: string
    sql:${TABLE}.Hospital_Name ;;
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

  dimension: musculoskeletal {
    type: number
    sql:CASE WHEN ${TABLE}.Musculoskeletal = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Musculoskeletal as INT64) END ;;
  }

  dimension: nervous_system {
    type: number
    sql:CASE WHEN ${TABLE}.Nervous_System = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Nervous_System as INT64) END ;;
  }

  dimension: other {
    type: number
    sql:CASE WHEN ${TABLE}.Other = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Other as INT64) END;;
  }

  dimension: provider_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Provider_ID ;;
  }

  dimension: respiratory {
    type: number
    sql:CASE WHEN  ${TABLE}.Respiratory = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Respiratory as INT64) END;;
  }

  dimension: skin {
    type: number
    sql:CASE WHEN ${TABLE}.Skin = 'Not Available' THEN 0 ELSE CAST(${TABLE}.Skin as INT64) END;;
  }

  measure: count {
    type: count
    drill_fields: [hospital_name]
  }
  measure: gastrointestinal_measure {
    group_label: "Outpatient sums"
    type: sum
    sql: ${gastrointestinal} ;;
  }
  measure: cardiovascular_measure {
    group_label: "Outpatient sums"
    type: sum
    sql: ${cardiovascular} ;;
  }
  measure: eye_measure {
    type: sum
    group_label: "Outpatient sums"
    sql: ${eye};;
  }
  measure: genitourinary_measure {
    type: sum
    group_label: "Outpatient sums"
    sql: ${genitourinary};;
  }
  measure: musculoskeletal_measure {
    group_label: "Outpatient sums"
    type: sum
    sql: ${musculoskeletal} ;;
  }
  measure: nervous_system_measure{
    group_label: "Outpatient sums"
    type: sum
    sql: ${nervous_system} ;;
  }
  measure: other_measure {
    group_label: "Outpatient sums"
    type: sum
    sql: ${other} ;;
  }
  measure: respiratory_measure {
    group_label: "Outpatient sums"
    type: sum
    sql: ${respiratory} ;;
  }
  measure: skin_measure {
    group_label: "Outpatient sums"
    type: sum
    sql: ${skin} ;;
  }
  measure: total_patients {
    type: number
    sql:
    ${gastrointestinal_measure}
    + ${cardiovascular_measure}
    + ${eye_measure}
    + ${genitourinary_measure}
    + ${musculoskeletal_measure}
    + ${nervous_system_measure}
    + ${other_measure}
    + ${respiratory_measure}
    + ${skin_measure}
    ;;
  }


}
