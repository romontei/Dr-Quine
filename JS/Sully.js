let i = 5;
const fs = require('fs');
const exec = require('child_process').exec;

const BUILD = (fileName) => {
	exec(`node ${fileName}`, err => err ? console.log(err.message) : true);
}

const WRITE = (path, cpt) => {
	let tmp = i;
	tmp--;

	const obj = {
		depBas: `let i = ${cpt};\nconst fs = require('fs');\nconst exec = require('child_process').exec;\n\n`,
		depDec: `let i = ${tmp};\nconst fs = require('fs');\nconst exec = require('child_process').exec;\n\n`,
		bld: `const BUILD = ${BUILD.toString()}\n\n`,
		wrt: `const WRITE = ${WRITE.toString()}\n\n`,
		qui: `const quine = ${quine.toString()}\n\n`,
		com: `// Call the define that lets the magic begin\nquine();\n`
	};

	const bas = `${obj.depBas}${obj.bld}${obj.wrt}${obj.qui}${obj.com}`;
	const dec = `${obj.depDec}${obj.bld}${obj.wrt}${obj.qui}${obj.com}`;
	//	fs.writeFile(path, res, err => err ? console.log(err.message) : true);

	//const file = await fs.readFile(path, 'utf8');
	//await fs.writeFile(path, res);

	fs.writeFile(path, dec, err => err ? console.log(err.message) : true);
	exec(`node ${path}`, err => err ? console.log(err.message) : true);
	fs.writeFile(path, bas, err => err ? console.log(err.message) : true);
}

const quine = _ => {
	if (i >= 0) {
		WRITE(`Sully_${i}.js`, i);
	}
}

// Call the define that lets the magic begin
quine();
