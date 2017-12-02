var Sugar = require('sugar');
Sugar.extend();

var lineReader = require('readline').createInterface({
  input: require('fs').createReadStream('input.txt')
})

var result = 0
lineReader.on('line', (line) => {
  var numbers = line
    .split(' ')
    .compact(true)
    .map(number => parseInt(number))
  var number = numbers.max() - numbers.min()
  result += number
})

lineReader.on('close', () => {
  console.log(result)
})
