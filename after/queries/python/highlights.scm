; extends
(list_splat_pattern ("*" @operator.splat))
(dictionary_splat_pattern ("**" @operator.splat))

(import_from_statement) "from" @import_from

((function_definition name: (identifier) @base_constructor)
(#any-of? @base_constructor "__new__" "__init__"))

((identifier) @keyword (#vim-match? @keyword "^(kwargs|self)$"))
(class_definition "class" @keyword.class)

"{" @punctuation.brace
"}" @punctuation.brace
