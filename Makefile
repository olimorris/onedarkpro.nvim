all: test

test:
	nvim --headless --noplugin -u tests/001_spec.vim +Test1
	nvim --headless --noplugin -u tests/002_spec.vim +Test2
