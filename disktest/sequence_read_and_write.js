var fs = require('fs');
var file = require('./file');
function end() {
	process.exit();
}

function write(path, data, cb) {
	fs.writeFile(path, data, function(err) {
	    if(err) {
	        return console.log(err);
	    }
	    cb();
	});
}

function getBuffer(mb) {
	var buffer = new Buffer(mb * 1024 * 1024);
	return buffer;
}

function main() {
	var buffer = getBuffer(1000);
	console.time("write");
	//write("./data/test5", buffer, function() {
		console.timeEnd("write");

		console.time("read");
		file.readRandomly(100, 5, function() {
			console.timeEnd("read");
			end();
		});
	//});
}

main();