; extends
("=>" @odp.operator.fat_arrow)

(interface_declaration
  (interface_body
    (property_signature
      (property_identifier) @odp.property.function
      (type_annotation
        (type_identifier) @type
      )
      (#eq? @type "FuncType")
    )
  )
)
