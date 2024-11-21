PANVIMDOC_DIR = misc/panvimdoc
PANVIMDOC_URL = https://github.com/kdheepak/panvimdoc
PLENARY_DIR = misc/plenary
PLENARY_URL = https://github.com/nvim-lua/plenary.nvim
NV_VERSION := $(shell nvim --version | head -1 | grep -o '[0-9]\.[0-9]')

all: format test docs extra

docs: $(PANVIMDOC_DIR)
	@cd $(PANVIMDOC_DIR) && \
	pandoc \
		--metadata="project:onedarkpro.nvim" \
		--metadata="description:Atom's iconic One Dark theme for Neovim" \
		--metadata="toc:true" \
		--metadata="incrementheadinglevelby:0" \
		--metadata="treesitter:true" \
		--lua-filter scripts/skip-blocks.lua \
		--lua-filter scripts/include-files.lua \
		--lua-filter scripts/remove-emojis.lua \
		-t scripts/panvimdoc.lua \
		../../README.md \
		-o ../../doc/onedarkpro.nvim.txt

$(PANVIMDOC_DIR):
	git clone --depth=1 --no-single-branch $(PANVIMDOC_URL) $(PANVIMDOC_DIR)
	@rm -rf doc/panvimdoc/.git

check:
	stylua --check lua/ tests/ -f ./stylua.toml

format:
	stylua lua/ tests/ -f ./stylua.toml

test: $(PLENARY_DIR)
	nvim --headless --noplugin -u tests/basic_spec.vim +BasicSpec
	nvim --headless --noplugin -u tests/config_spec.vim +ConfigSpec
	nvim --headless --noplugin -u tests/source_spec.vim +SourceSpec
	nvim --headless --noplugin -u tests/cache_spec.vim +CacheSpec
	nvim --headless --noplugin -u tests/helpers_spec.vim +HelpersSpec
# ifeq ($(NV_VERSION), 0.9)
# 	nvim --headless -u tests/semantic_token_spec.vim +SemanticTokenSpec
# endif

extra:
	nvim --headless -u tests/basic_spec.vim +"lua require('onedarkpro.extra').setup()" +qa

$(PLENARY_DIR):
	git clone --depth=1 --branch v0.1.3 $(PLENARY_URL) $(PLENARY_DIR)
	@rm -rf $(PLENARY_DIR)/.git
