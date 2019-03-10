// Here you have a gentle Colleen in JS
let quine = _ => {
	// El famoso console.log()
	console.log(`// Here you have a gentle Colleen in JS\nlet quine = ${quine.toString()}\nquine();`)
}
quine();
