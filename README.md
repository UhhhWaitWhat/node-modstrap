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
	index.js
	package.json
	test/index.js

It will fill them with provided data and sensible defaults.
