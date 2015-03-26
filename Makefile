BIN = ./node_modules/.bin

build: template.json

template.json: template
	@$(BIN)/tdir scan --encoding=utf8 $< --output $@

clean:
	@rm -rf template.json

lint:
	@$(BIN)/jshint index.js --reporter node_modules/jshint-stylish/stylish.js

release-major: build lint
	@$(BIN)/bump --major

release-minor: build lint
	@$(BIN)/bump --minor

release-patch: build lint
	@$(BIN)/bump --major

publish:
	git push --tags origin HEAD:master
	npm publish
