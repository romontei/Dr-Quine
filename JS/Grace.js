const fs = require('fs');

const WRITE = (path, res) => {
	fs.writeFile(path, res, err => err ? console.log(err.message) : true);
}

const quine = _ => {
	const res = {
		dep: `const fs = require('fs');\n\n`,
		wrt: `const WRITE = ${WRITE.toString()}\n\n`,
		qui: `const quine = ${quine.toString()}\n\n`,
		com: `// Call the define that lets the magic begin\nquine();\n`
	};
	WRITE("Grace_kid.js", `${res.dep}${res.wrt}${res.qui}${res.com}`);
}

// Call the define that lets the magic begin
quine();
