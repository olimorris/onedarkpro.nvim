import React from "react";

export default class App extends React.Component {
  constructor() {
    super();
    this.state = {
      count: 0,
    };
    this.handleClick = this.handleClick.bind(this);
  }
  handleClick() {
    this.setState((preState) => {
      return {
        count: preState + 1,
      };
    });
  }
  render() {
    return (
      <div>
        <h1>{this.state.count}</h1>
        <button onClick={this.handleClick}>Change!</button>
      </div>
    );
  }
}

function sum(a, b) {
  return Promise(function (resolve, reject) {
    setTimeout(function () {
      // send the response after 1 second
      if (typeof a !== "number" || typeof b !== "number") {
        // testing input types
        return reject(new TypeError("Inputs must be numbers"));
      }
      resolve(a + b);
    }, 1000);
  });
}
var myPromise = sum(10, 5);
myPromise
  .then(function (result) {
    document.write(" 10 + 5: ", result);
    return sum(null, "foo"); // Invalid data and return another promise
  })
  .then(function () {
    // Won't be called because of the error
  })
  .catch(function (err) {
    // The catch handler is called instead, after another second
    console.error(err); // => Please provide two numbers to sum.
  });

function addNumbers(a, b) {
  return a + b;
}
x = addNumbers(1, 2);

if (age >= 14 && age < 19) {
  // logical condition
  action = "Eligible."; // executed if condition is true
} else {
  // else block is optional
  action = "Not eligible."; // executed if condition is false
}

switch (
  new Date().getDay() // input is current day
) {
  case 6: // if (day == 6)
    text = "Saturday";
    break;
  case 0: // if (day == 0)
    text = "Sunday";
    break;
  default: // else...
    text = "Whatever";
}

var age = 18; // number
var name = "Jane"; // string
var name = { first: "Jane", last: "Doe" }; // object
var truth = false; // boolean
var sheets = ["HTML", "CSS", "JS"]; // array
var a;
typeof a; // undefined
var a = null; // value null

var i = 1; // initialize
while (i < 100) {
  // enters the cycle if statement is true
  i *= 2; // increment to avoid infinite loop
  document.write(i + ", "); // output
}
