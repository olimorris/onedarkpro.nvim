; extends
(list_splat_pattern ("*" @odp.operator.splat))
(dictionary_splat_pattern ("**" @odp.operator.splat))

(import_statement name: (dotted_name (identifier) @odp.import_module (#set! "priority" 126)))
(import_from_statement name: (dotted_name (identifier) @odp.import_module (#set! "priority" 126)))
(import_from_statement module_name: (relative_import (dotted_name (identifier) @odp.import_module (#set! "priority" 126))))
(import_from_statement module_name: (dotted_name (identifier) @odp.import_module (#set! "priority" 126)))

((function_definition name: (identifier) @odp.base_constructor)
(#any-of? @odp.base_constructor "__new__" "__init__"))

(call function: (identifier) @odp.constructor
(#any-of? @odp.constructor "range" "list" "tuple" "dict" "set" "frozenset" "str" "int" "float" "complex" "bool" "bytes" "bytearray" "memoryview" "type"))

((identifier) @odp.keyword (#vim-match? @odp.keyword "^(kwargs|self)$"))
(class_definition "class" @odp.keyword.class)

"{" @odp.punctuation.brace
"}" @odp.punctuation.brace
