; extends
("=>" @operator.fat_arrow)

(jsx_opening_element (jsx_attribute (property_identifier) @jsxtag))

(statement_block "{" @statement.punctuation.bracket)
(statement_block "}" @statement.punctuation.bracket)
(return_statement (object "{" @statement.punctuation.bracket))
(return_statement (object "}" @statement.punctuation.bracket))

(assignment_expression (object "{" @expression.punctuation.bracket))
(assignment_expression (object "}" @expression.punctuation.bracket))

(function_declaration (statement_block "{" @punctuation.bracket))
(function_declaration (statement_block "}" @punctuation.bracket))

; (arrow_function (formal_parameters "(" @function.punctuation.bracket))
; (arrow_function (formal_parameters ")" @function.punctuation.bracket))
; (call_expression (arguments "(" @function.punctuation.bracket))
; (call_expression (arguments ")" @function.punctuation.bracket))
; (return_statement (parenthesized_expression "(" @function.punctuation.bracket))
; (return_statement (parenthesized_expression ")" @function.punctuation.bracket))
