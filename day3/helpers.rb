module Direction
  UP = 0
  RIGHT = 1
  LEFT = 2
  DOWN = 3
end

module Helpers
  def move(direction, point, steps)
    case direction
    when Direction::UP
      point.y += steps
    when Direction::LEFT
      point.x -= steps
    when Direction::RIGHT
      point.x += steps
    when Direction::DOWN
      point.y -= steps
    end
  end

  def next_direction(direction)
    case direction
    when Direction::UP
      Direction::LEFT
    when Direction::LEFT
      Direction::DOWN
    when Direction::RIGHT
      Direction::UP
    when Direction::DOWN
      Direction::RIGHT
    end
  end
end