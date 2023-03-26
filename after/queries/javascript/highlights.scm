; extends
("=>" @odp.operator.fat_arrow)

(jsx_opening_element (jsx_attribute (property_identifier) @odp.jsxtag))

(statement_block ["{" "}"] @odp.statement.punctuation.bracket)
(return_statement (object ["{" "}"] @odp.statement.punctuation.bracket))
(assignment_expression (object ["{" "}"] @odp.expression.punctuation.bracket))
(function_declaration (statement_block ["{" "}"] @odp.punctuation.bracket))

; (arrow_function (formal_parameters "(" @odp.function.punctuation.bracket))
; (arrow_function (formal_parameters ")" @odp.function.punctuation.bracket))
; (call_expression (arguments "(" @odp.function.punctuation.bracket))
; (call_expression (arguments ")" @odp.function.punctuation.bracket))
; (return_statement (parenthesized_expression "(" @odp.function.punctuation.bracket))
; (return_statement (parenthesized_expression ")" @odp.function.punctuation.bracket))
