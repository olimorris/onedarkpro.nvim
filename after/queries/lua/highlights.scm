; extends
((field
  name: (identifier) @odp.function_assignment
  value: (function_definition)
) (#set! "priority" 126))

((expression_list
  (function_call
    (identifier) @odp.function_assignment
  )
) (#set! "priority" 126))

(function_declaration
  name: (method_index_expression
    table: (identifier) @odp.class)
)
(function_declaration
  name: (dot_index_expression
    table: (identifier) @odp.class)
)

((
 (function_call (identifier) @odp.plenary_function)
 (#match? @odp.plenary_function "describe|it|before_each|after_each")
) (#set! "priority" 126))
