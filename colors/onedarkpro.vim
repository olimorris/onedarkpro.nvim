lua << EOF
require("onedarkpro").load()
EOF

command! OnedarkproCache lua require('onedarkpro').cache()
command! OnedarkproClean lua require('onedarkpro').clean()
command! OnedarkproColors lua require('onedarkpro.utils.colorizer').show()
