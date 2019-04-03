var http = require('http');
var async = require('async')
var request = require('request');

var options = {
  host: 'localhost',
    path: '/'
};

callback = function(response) {
}


var N = 290000;

function randomNumber(a,b)
{
  if(b == undefined) {
    b = a;
    a = 0;
  }
  var delta = b - a + 1;
  return Math.floor(Math.random()*delta) + a;
}

var avglag = 0;
var count = 0;
function emit(i, time) {
  count++;
  var lag = new Date().getTime() - time;
  avglag = (avglag * (count - 1) + lag) / count;
  if (count % 1000 == 0) {
    
      console.log(count + ":" + Math.round(avglag*100) / 100 + "ms")
    
  }
  http.request(options, callback).end();

  //request('http://localhost/', function (error, response, body) {  });
  if (count == N) {
    console.log('DONE', avglag , "ms")
    console.log('INPUT RATE', InputRate, 'req/s CCU', InCCU)
    process.exit(1);
  }
}

var a = Array(N);
console.log(a.length)
var InputRate = 0;
var j = 0;
var nw = new Date().getTime();
var InCCU = 10000
async.eachLimit(a, InCCU, function(i, cb) {
  var r = randomNumber(0, 20000)
  setTimeout(emit, r, j++, new Date().getTime() + r)
  
  setTimeout(function() {
    cb(null, true);
  }, 1);
}, function(err, done) {
     InputRate =Math.round( N * 1000 / (new Date().getTime() - nw))
   console.log('done');
});