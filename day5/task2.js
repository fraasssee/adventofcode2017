var fs = require('fs');

fs.readFile('input.txt', 'utf8', (err, data) => {
  var input = data.split('\n').map(n => parseInt(n))
  var moves = 0;
  var position = 0;
  while(position < input.length) {
    var new_position = input[position] + position;
    if (input[position] > 2) {
      input[position] -= 1;
    } else {
      input[position] += 1;
    }
    position = new_position;
      moves += 1;
  }
  console.log(moves)
})
