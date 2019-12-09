include: "/views/**/unplanned_visits.view"

view: new_test {
  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: compared_to_national {
    type: string
    sql: ${TABLE}.Compared_to_National ;;
  }
}
