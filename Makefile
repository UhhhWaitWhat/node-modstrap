BIN = ./node_modules/.bin

build: template.json

template.json: template
	@$(BIN)/tdir scan --encoding=utf8 $< --output $@

clean:
	@rm -rf template.json

lint:
	@$(BIN)/eslint index.js

release-major: build lint
	@$(BIN)/bump --major

release-minor: build lint
	@$(BIN)/bump --minor

release-patch: build lint
	@$(BIN)/bump --patch

publish:
	git push --tags origin HEAD:master
	npm publish
