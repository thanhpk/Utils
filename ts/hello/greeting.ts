interface Person {
    firstName: string;
    lastName: string;
}

function greeter(person: Person) {
    return "Hello, " + person.firstName + " " + person.lastName;
}

var user = { firstName: "Jane", lastName: "User" };
console.log(greeter(user));

import config = require('config');
import fs = require('fs');

console.log(config.get("a"));

import * as calc from "./calc";

console.log(calc, calc.Cacl);
var a = new calc.Cacl.Cacl();
var r = a.add(4,3);
console.log(r);

import * as person from "./subdir/person";
var p = new person.Person();
p.callname();