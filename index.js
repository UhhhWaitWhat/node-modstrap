#!/usr/bin/env node
var tdir = require('tdir');
var inquirer = require('inquirer');
var hbs = require('handlebars');
var fs = require('fs');
var path = require('path');

inquirer.prompt([{
	type: "input",
	name: "name",
	message: "The name of your module"
},{
	type: "input",
	name: "repo",
	message: "The github repository (user/repo)"
},{
	type: "input",
	name: "author",
	message: "Your Name"
}], function(answers) {
	answers.year = new Date().getFullYear();
	var template = fs.readFileSync(path.join(__dirname, 'template.json'));
	var templating = function(content) {
		return hbs.compile(content)(answers);
	};

	tdir.apply({
		template: JSON.parse(template),
		templating: templating,
		directory: answers.repo.split('/')[1]
	});
});
