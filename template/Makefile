BIN = ./node_modules/.bin
SRC = $(wildcard src/*.js)
LIB = $(SRC:src/%.js=lib/%.js)

build: babel
babel: $(LIB)

lib/%.js: src/%.js
	@mkdir -p $(@D)
	@$(BIN)/babel $< --out-file $@

clean:
	@rm -rf lib

test: build lint
	mocha --require must

lint:
	@$(BIN)/jshint src --reporter node_modules/jshint-stylish/stylish.js

release-major: test
	@$(BIN)/bump --major

release-minor: test
	@$(BIN)/bump --minor

release-patch: test
	@$(BIN)/bump --major

publish:
	git push --tags origin HEAD:master
	npm publish