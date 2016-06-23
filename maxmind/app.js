var maxmind = require('maxmind');

var cityLookup = maxmind.open('/path/to/GeoLite2-City.mmdb');
var city = lookup.get('66.6.44.4');

var orgLookup = maxmind.open('/path/to/GeoOrg.mmdb');
var organization = orgLookup.get('66.6.44.4');
console.log(organization);