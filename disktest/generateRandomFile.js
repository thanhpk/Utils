var fs = require('fs');


var fs = require('fs');

function writeFile(n, cb) {
	if (n === 0) return cb();

	fs.writeFile("./data/random" + n, n + '', function(err) {
		if (err) console.log(err);
		writeFile(n - 1, cb);
	});
}


writeFile(100000, function() {
	console.log('done');
})
