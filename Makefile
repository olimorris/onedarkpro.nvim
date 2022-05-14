all: test

test:
	nvim --headless --noplugin -u tests/minimal.vim +Test
