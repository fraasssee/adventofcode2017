var Sugar = require('sugar');
Sugar.extend();

var lineReader = require('readline').createInterface({
  input: require('fs').createReadStream('input.txt')
});

var valid = 0;

lineReader.on('line', (line) => {
  var words = line.split(' ');
  var unique_words = words.unique();
  if (words.length == unique_words.length) {
    valid += 1;
  }
});

lineReader.on('close', () => {
  console.log(valid)
})