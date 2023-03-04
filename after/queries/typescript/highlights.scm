;; extends
[
("=>" @operator.fat_arrow (#set! "priority" 1000))
]

[
(enum_declaration (enum_body (property_identifier) @property.enum) (#set! "priority" 1000))
]

[
(interface_declaration (object_type (property_signature (property_identifier) @property.function (type_annotation (type_identifier) @type) (#eq? @type "FuncType"))))
]
