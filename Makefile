NV_VERSION := $(shell nvim --version | head -1 | grep -o '[0-9]\.[0-9]')

format:
	stylua --check .

test:
	nvim --headless --noplugin -u tests/basic_spec.vim +BasicSpec
	nvim --headless --noplugin -u tests/config_spec.vim +ConfigSpec
	nvim --headless --noplugin -u tests/source_spec.vim +SourceSpec
	nvim --headless --noplugin -u tests/cache_spec.vim +CacheSpec
	nvim --headless --noplugin -u tests/helpers_spec.vim +HelpersSpec
ifeq ($(NV_VERSION), 0.9)
	nvim --headless -u tests/semantic_token_spec.vim +SemanticTokenSpec
endif
