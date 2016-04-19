"use strict";
function greeter(person) {
    return "Hello, " + person.firstName + " " + person.lastName;
}
var user = { firstName: "Jane", lastName: "User" };
console.log(greeter(user));
var config = require('config');
console.log(config.get("a"));
var calc = require("./calc");
console.log(calc, calc.Cacl);
var a = new calc.Cacl.Cacl();
var r = a.add(4, 3);
console.log(r);
var person = require("./subdir/person");
var p = new person.Person();
p.callname();
//# sourceMappingURL=greeting.js.map