;; extends
[
("=>" @operator.fat_arrow)
]

[
(enum_body
  (property_identifier) @enum.member (#set! "priority" 150))
]

[
(interface_declaration (object_type (property_signature (property_identifier) @property.function (type_annotation (type_identifier) @type) (#eq? @type "FuncType"))))
]

[((identifier) @variable.builtin
 (#vim-match? @variable.builtin "^(arguments|module|console|window|document)$")
 (#set! "priority" 150))
]
