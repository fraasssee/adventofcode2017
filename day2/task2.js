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
  var res = numbers.map(n => {
    var match = numbers.find(m => m !== n && (m % n) == 0)
    if (match) {
      return [n, match]
    }
  }).compact().first()
  result += res[1] / res[0]
})

lineReader.on('close', () => {
  console.log(result)
})
