NV_VERSION := $(shell nvim --version | head -1 | grep -o '[0-9]\.[0-9]')
FP_FILE = ./lua/onedarkpro/fingerprint.lua

fp := $(shell git ls-files -- './lua/*' './colors/*' './plugin/*' | grep -v 'fingerprint.lua' | git hash-object --stdin-paths | git hash-object --stdin)

all: fingerprint test

fingerprint:
	echo "return [[$(fp)]]" > $(FP_FILE)

test:
	nvim --headless --noplugin -u tests/basic_spec.vim +BasicSpec
	nvim --headless --noplugin -u tests/config_spec.vim +ConfigSpec
	nvim --headless --noplugin -u tests/theme_spec.vim +ThemeSpec
	nvim --headless --noplugin -u tests/link_groups_spec.vim +LinkGroupsSpec
	nvim --headless --noplugin -u tests/source_spec.vim +SourceSpec
	nvim --headless --noplugin -u tests/cache_spec.vim +CacheSpec
# ifeq ($(NV_VERSION), 0.8)
# 	nvim --headless --noplugin -u tests/cache_spec.vim +CacheSpec
# endif
# ifeq ($(NV_VERSION), 0.9)
# 	nvim --headless --noplugin -u tests/cache_spec.vim +CacheSpec
# endif
