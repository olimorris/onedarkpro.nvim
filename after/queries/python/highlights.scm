; extends
(list_splat_pattern ("*" @odp.operator.splat))
(dictionary_splat_pattern ("**" @odp.operator.splat))
(list_splat ("*" @odp.operator.splat))
(dictionary_splat ("**" @odp.operator.splat))

(import_statement name: (dotted_name (identifier) @odp.import_module (#set! "priority" 126)))
(import_statement name: (aliased_import name: (dotted_name (identifier) @odp.import_module (#set! "priority" 126))))
(import_from_statement name: (dotted_name (identifier) @odp.import_module (#set! "priority" 126)))
(import_from_statement module_name: (relative_import (dotted_name (identifier) @odp.import_module (#set! "priority" 126))))
(import_from_statement module_name: (dotted_name (identifier) @odp.import_module (#set! "priority" 126)))

((identifier) @odp.base_constructor
(#any-of? @odp.base_constructor "__new__" "__init__"))

(call function: (identifier) @odp.constructor
(#any-of? @odp.constructor "range" "list" "tuple" "dict" "set" "frozenset" "str" "int" "float" "complex" "bool" "bytes" "bytearray" "memoryview" "type"))

((identifier) @odp.keyword (#vim-match? @odp.keyword "^(kwargs|self)$"))
(class_definition "class" @odp.keyword.class)

["(" ")" "[" "]" "{" "}"] @odp.punctuation.bracket

(interpolation
  "{" @odp.punctuation.special
  "}" @odp.punctuation.special)
(dictionary ["{" "}"] @odp.punctuation.special)

("@" @odp.decorator (#set! "priority" 126))
(decorator (call function: (attribute attribute: (identifier) @odp.decorator.function (#set! "priority" 126))))

(string (interpolation (identifier) @odp.interpolation))

(
  (call
    arguments: [
      (_ (identifier) @odp.variable.parameter)
      (argument_list (_ (identifier) @odp.variable.parameter))
    ]
  )
  (#set! "priority" 126)
)
(
  (call
    arguments: (argument_list
                 (subscript
                   "[" @odp.bracket.subscript.open
                   "]" @odp.bracket.subscript.close)))
  (#set! "priority" 126)
)

(
  (call
    function: (identifier) @odp.function.builtin
  )
  (#any-of? @odp.function.builtin
    "abs" "all" "any" "ascii" "bin" "bool" "bytearray" "bytes"
    "callable" "chr" "classmethod" "compile" "complex" "delattr"
    "dict" "dir" "divmod" "enumerate" "eval" "exec" "filter"
    "float" "format" "frozenset" "getattr" "globals" "hasattr"
    "hash" "help" "hex" "id" "input" "int" "isinstance"
    "issubclass" "iter" "len" "list" "locals" "map" "max"
    "memoryview" "min" "next" "object" "oct" "open" "ord"
    "pow" "print" "property" "range" "repr" "reversed" "round"
    "set" "setattr" "slice" "sorted" "str" "sum" "super"
    "tuple" "type" "vars" "zip" "__import__"
  )
(#set! "priority" 126)
)
