const meow = require('meow');
const meowHelp = require('cli-meow-help');

const flags = {
	clear: {
		type: `boolean`,
		default: true,
		alias: `c`,
		desc: `Clear the console`
	},
	noClear: {
		type: `boolean`,
		default: false,
		desc: `Don't clear the console`
	},
	debug: {
		type: `boolean`,
		default: false,
		alias: `d`,
		desc: `Print debug info`
	},
	version: {
		type: `boolean`,
		alias: `v`,
		desc: `Print CLI version`
	}
};

const commands = {
	help: { 
		desc: `Print help info`,
	},
	ir: {
		desc: `Print all instrument for rent for a specific instrument and nothing if it get anything`,
	},
	icr: {
		desc: `Print all instrument currently being rented`
	},
	ri: {
		desc: `rent an instrument for a specific student`
	},
	ticr: {
		desc: `terminate an instrument currently being rented for a specific student`
	}

};

const helpText = meowHelp({
	name: `soundgood`,
	flags,
	commands
});

const options = {
	inferType: true,
	description: false,
	hardRejection: false,
	flags
};

module.exports = meow(helpText, options);
