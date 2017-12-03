require 'json'

module Direction
  UP = 0
  RIGHT = 1
  LEFT = 2
  DOWN = 3
end

class Memory
  Point = Struct.new(:x, :y, :value)


  def initialize(logger)
    @logger = logger
  end

  def find_point(args)
    point = Point.new(0, 0, 1)
    number = args[0].to_i
    direction = Direction::RIGHT
    next_corner(1, point, direction, number, true)
    distance = point.x.abs + point.y.abs
    @logger.puts(distance)
  end

  private

  def next_corner(steps, point, direction, goal, first)
    if (point.value + steps) < goal
      move(direction, point, steps)
      point.value = point.value + steps
      new_direction = next_direction(direction)
      new_steps = if !first
        steps + 1
      else
        steps
      end
      next_corner(new_steps, point, new_direction, goal, !first)
    else
      diff = goal - point.value
      point.value = goal
      move(direction, point, diff)
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

  def move(direction, point, steps)
    case direction
    when Direction::UP
      point.x += steps
    when Direction::LEFT
      point.y -= steps
    when Direction::RIGHT
      point.y += steps
    when Direction::DOWN
      point.x -= steps
    end
  end
end
