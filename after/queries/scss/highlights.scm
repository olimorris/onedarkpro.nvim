; extends
(rule_set (selectors) @odp.selector (#set! "priority" 125))
(declaration (property_name) @odp.vendor_prefix (#match? @odp.vendor_prefix "^-"))
(declaration (variable_value) @odp.variable)
(class_selector (nesting_selector) . (class_name) @odp.nesting_selector (#set! "priority" 126))
(pseudo_class_selector (class_name) @odp.pseudo_class (#set! "priority" 125))

