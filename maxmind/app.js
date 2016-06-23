var maxmind = require('maxmind');

var cityLookup = maxmind.open('./GeoLite2-City.mmdb');
var city = cityLookup.get('42.113.94.71');

console.log(city);