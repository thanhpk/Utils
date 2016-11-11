var fs = require('fs');

function randomInt (low, high) {
    return Math.floor(Math.random() * (high - low) + low);
}

exports.readRandomly = function( n, interval, cb) {
	if (n === 0) {
		cb();
		return;
	}

	setTimeout(function() {
		var path = "./data/random" + randomInt(0, 100000);
		console.log(path)
		fs.readFile(path, function(err, data) {
			if (err) {
				console.log(err);
			}
			exports.readRandomly(n - 1, interval, cb);
		});	
	}, interval);
}
