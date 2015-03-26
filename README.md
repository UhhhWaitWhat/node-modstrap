modstrap
========
This module helps modstrapping io.js modules. Simply install it via `npm install -g modstrap`.
Use with io.js as it needs generator support to run.

Then simply run `modstrap` in your development directory.
This module will ask you for some data and then creates a new directory containing the following files:

	.gitignore
	.travis.yml
	LICENSE
	README.md
	Makefile
	package.json
	src/index.js
	test/index.js

It will fill them with provided data and sensible defaults (in my opinion).

Makefile
--------
The `Makefile` provides the following tasks:

* **build**: Runs everything in `src` through babel and outputs to `lib`.
* **clean**: Removes `lib`
* **test**: Runs mocha
* **lint**: Runs jshint over `src`
* **release-{major,minor,patch}**: Increases version number and creates git tag 
* **publish**: Pushes to git and npm