BIN = ./node_modules/.bin

build: template.json

template.json: template
	@$(BIN)/tdir scan --encoding=utf8 $< --output $@

clean:
	@rm -rf template.json

lint:
	@$(BIN)/eslint index.js

release-major: build lint
	git commit template.json -m 'Rebuild template.json'
	@$(BIN)/bump --major

release-minor: build lint
	git commit template.json -m 'Rebuild template.json'
	@$(BIN)/bump --minor

release-patch: build lint
	git commit template.json -m 'Rebuild template.json'
	@$(BIN)/bump --patch

publish:
	git push --tags origin HEAD:master
	npm publish
