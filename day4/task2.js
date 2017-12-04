var Sugar = require('sugar');
Sugar.extend();

var lineReader = require('readline').createInterface({
  input: require('fs').createReadStream('input.txt')
});

var valid = 0;

lineReader.on('line', (line) => {
  var words = line.split(' ');
  var pattern = {};
  var isValid = true;
  words.forEach((word) => {
    var sorted = word.split('').sort().join('');
    pattern[sorted] ? isValid = false : pattern[sorted] = 1 
  });
  if (isValid) {
    valid += 1;
  }
});

lineReader.on('close', () => {
  console.log(valid);
});