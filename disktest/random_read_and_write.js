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


function read(path, cb) {
	fs.readFile(path, function(err, data) {
		if (err) {
			console.log(err);
			return;
		}
		cb(data);
	});
}

function main() {
	var buffer = getBuffer(1000);
	console.time("write");
	write("./data/test4", buffer, function() {
		console.timeEnd("write");
		//end();
	});

	console.time("read");
	file.readRandomly(2, 500, function() {
		console.timeEnd("read");
	});
}

main();