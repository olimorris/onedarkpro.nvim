; extends
((
 ((command_name) @odp.command)
 (#match? @odp.command "eq|neq|geq|leq|gt|lt|approx|sim|simeq|equiv|doteq|cong|asymp|simeq|approx|sim")
) (#set! "priority" 126))


((curly_group_text
  (text
    (word) @odp.curly_group_word)
) (#set! "priority" 126))
