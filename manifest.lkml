project_name: "tj_thesis_med"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
local_dependency: {
  project: "tj_thesis_demographics"
}

constant: format_single_vis_dim {
  value: "{% if value == \"Above the national average\" %}<p style=\"color:green; \">{{rendered_value}} {% elsif value == \"Below the national average\" %}<p style=\"color:red; \">{{rendered_value}}{% elsif value == \"Same as the national average\"%}<p style=\"color:orange;\">{{rendered_value}}{% else %}{{rendered_value}} {% endif %}"
}
