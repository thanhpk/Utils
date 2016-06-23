var maxmind = require('maxmind');

var cityLookup = maxmind.open('./GeoLite2-City.mmdb', {cache: {
    max: 1000, // max items in cache
    maxAge: 1000 * 60 * 60 // life time in milliseconds
  }});
var city = cityLookup.get('42.113.94.71');

console.log(city);