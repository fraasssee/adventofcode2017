var fs = require('fs');
var Sugar = require('sugar');
Sugar.extend();

fs.readFile('input.txt', 'utf8', (err, data) => {
  var array = data.split(' ').compact(true).map(i => parseInt(i));
  var combinations = {}
  var counter = 0
  while (!combinations[array.join('')]) {
    combinations[array.join('')] = counter;
    var indexLargest = 0;
    array.forEach((item, i) => item > array[indexLargest] ? indexLargest = i : null);
    var numbers = array[indexLargest]
    array[indexLargest] = 0;
    for (var i = 1; i <= numbers; i++) {
      array[(indexLargest + i) % array.length]++;
    }
    counter++;
  }
  console.log(counter - combinations[array.join('')])
})