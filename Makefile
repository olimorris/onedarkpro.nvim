PANVIMDOC_DIR = misc/panvimdoc
PANVIMDOC_URL = https://github.com/kdheepak/panvimdoc
PLENARY_DIR = misc/plenary
PLENARY_URL = https://github.com/nvim-lua/plenary.nvim
NV_VERSION := $(shell nvim --version | head -1 | grep -o '[0-9]\.[0-9]')

all: format test docs extra

docs: deps/panvimdoc
	@echo Generating Docs...
	@pandoc \
		--metadata="project:onedarkpro.nvim" \
		--metadata="description:Atom's iconic One Dark theme for Neovim" \
		--metadata="toc:true" \
		--metadata="incrementheadinglevelby:0" \
		--metadata="treesitter:true" \
		--lua-filter deps/panvimdoc/scripts/include-files.lua \
		--lua-filter deps/panvimdoc/scripts/skip-blocks.lua \
		-t deps/panvimdoc/scripts/panvimdoc.lua \
		README.md \
		-o doc/onedarkpro.nvim.txt


check:
	@echo Checking...
	stylua --check lua/ tests/ -f ./stylua.toml

format:
	@echo Formatting...
	@stylua tests/ lua/ -f ./stylua.toml

test: deps
	@echo Testing...
	nvim --headless --noplugin -u ./scripts/minimal_init.lua -c "lua MiniTest.run()"

test_file: deps
	@echo Testing File...
	nvim --headless --noplugin -u ./scripts/minimal_init.lua -c "lua MiniTest.run_file('$(FILE)')"

extra:
	@echo Generating Extras...
	nvim --headless -u tests/basic_spec.vim +"lua require('onedarkpro.extra').setup()" +qa


deps: deps/plenary.nvim deps/nvim-treesitter deps/mini.nvim deps/panvimdoc
	@echo Pulling...

deps/plenary.nvim:
	@mkdir -p deps
	git clone --filter=blob:none https://github.com/nvim-lua/plenary.nvim.git $@

deps/nvim-treesitter:
	@mkdir -p deps
	git clone --filter=blob:none https://github.com/nvim-treesitter/nvim-treesitter.git $@

deps/mini.nvim:
	@mkdir -p deps
	git clone --filter=blob:none https://github.com/echasnovski/mini.nvim $@

deps/panvimdoc:
	@mkdir -p deps
	git clone --filter=blob:none https://github.com/kdheepak/panvimdoc $@
