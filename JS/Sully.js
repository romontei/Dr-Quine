let i = 5;
const fs = require('fs');
const exec = require('child_process').exec;

const BUILD = (path) => {
	// Execute the specified file
	exec(`node ${path}`, err => err ? console.log(err.message) : true);
}

const WRITE = (path, cpt) => {
	// Stores what we want to write
	const obj = {
		dep: `let i = ${cpt};\nconst fs = require('fs');\nconst exec = require('child_process').exec;\n\n`,
		bld: `const BUILD = ${BUILD.toString()}\n\n`,
		wrt: `const WRITE = ${WRITE.toString()}\n\n`,
		qui: `const quine = ${quine.toString()}\n\n`,
		com: `// Call the define that lets the magic begin\nquine();\n`
	};
	
	// Format the write content and write it
	const res = `${obj.dep}${obj.bld}${obj.wrt}${obj.qui}${obj.com}`;
	fs.writeFile(path, res, err => err ? console.log(err.message) : true);
}

const quine = _ => {
	// Check if its beginning - need to by synchronous 
	try {
		fs.openSync(`Sully_${i}.js`, 'r');
		i--;
	} catch (_) {}
	
	// Stop the process when the variable is set to 0
	if (i >= 0) {
		WRITE(`Sully_${i}.js`, i);
		BUILD(`Sully_${i}.js`);
	}
}

// Call the define that lets the magic begin
quine();
