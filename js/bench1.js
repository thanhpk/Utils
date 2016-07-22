"use strict";

var trycatch = require('trycatch');
var qs = require('querystring');
var url = require('url');
var fs = require('fs');
var http = require('http');
function HttpApi () {
	var me = this;

	this.fibonancy = function(x)
	{
		if(x==0) return 0;
		if(x==1) return 1;
		return this.fibonancy(x-1) + this.fibonancy(x-2);	
	}


	this.fibonancyCb = function(x, callback)
	{
		if(x==0) return callback(0);
		if(x==1) return callback(1);
		return setTimeout(function(){
			this.fibonancy(x-1, function(f1)
			{
				setTimeout(function(){
					this.fibonancy(x-2, function(f2)
					{
						callback(f1+f2);
					});
				}, 10); 
			});
		}, 10); 
	}

	//fibinancy only
	this.test1= function(res)
	{
		var f = this.fibonancy(fn);
		res.statusCode= 200;
		res.end(f + "");
	}

	//read + create file fibonancy
	this.test2 = function(res)
	{
		var me = this;
		var r = this.getRandom(0, 1000);
		fs.stat(`./tmp/tmp${r}` , function(err, stat)
		{
			if(err){
				var f = me.fibonancy(fn);
				fs.writeFile(`./tmp/tmp${r}`, (f+"").repeat(nbyte), function(err) {
    				if(err) {
    					res.statusCode=500;
						res.end('here62');
						throw err;
					}
					
					res.statusCode= 200;
					res.end(f+"");
				});
			}
			else
			{
				fs.readFile(`./tmp/tmp${r}`, (err, n) => {
 					if(err) {
    					res.statusCode=500;
						res.end('here73');
						throw err;
					}
  					n = n + ""; // ensure that there is no optimization here
  					var f = me.fibonancy(fn);
					res.statusCode= 200;
					res.end(f+"");
				});
			}
		});
    }

	this.getRandom = function (min, max) {
		return Math.round(Math.random() * (max - min)) + min;
	}

	function deleteFolderRecursive(path) {
		if( fs.existsSync(path) ) {
			fs.readdirSync(path).forEach(function(file,index){
				var curPath = path + "/" + file;
				if(fs.lstatSync(curPath).isDirectory()) { // recurse
					deleteFolderRecursive(curPath);
				} else { // delete file
					fs.unlinkSync(curPath);
				}
			});
			fs.rmdirSync(path);
		}
	}

	this.initTest2 = function()
	{
		deleteFolderRecursive('./tmp');
		fs.mkdirSync('./tmp');
	}

	this.handle = function(req, res, path) {
		var parts = path.split('/');
		res.statusCode = 200;
		var cs = parseInt(parts[1]);
		switch(cs)
		{
			case 1: 
				me.test1(res);
				break;
			case 2:
				me.test2(res);
				break;
			default:
				res.statusCode = 404;
				res.end();
				break;
		}
		return;
	};

	this.route = function (req, res) {
		var me = this;
		trycatch(function () {
			var url_parts = url.parse(req.url, true);
			req['params'] = url_parts.query;
			me.handle(req, res, url_parts.pathname);
		}, function (err) {
			res.statusCode = 500;
			res.end();
			console.log(err, err.stack);
		});
	};
};

var httpapi = new HttpApi();

httpapi.initTest2();

var server = http.createServer(function (req, res) {
	httpapi.route(req, res);
});

var httpport = process.argv[2] || 2108;
var fn = process.argv[3] || 20;
var nbyte = process.argv[4] || 200000;

server.listen(httpport, function () {
	console.log(`Server is running at port ${httpport}`);
});
