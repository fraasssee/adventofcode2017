class AdjacentMemory
  include Helpers

  Point = Struct.new(:x, :y, :value)
  SPACE = Hash.new


  def initialize(logger)
    @logger = logger
  end

  def find_point(args)
    point = Point.new(0, 0, 1)
    number = args[0].to_i
    direction = Direction::RIGHT
    SPACE[[point.x, point.y]] = point.value
    final_point = step(1, point, direction, number, true, 0)
    @logger.puts(final_point.value)
  end

  private

  def step(steps, old_point, direction, goal, first, taken_steps)
    point = Point.new(old_point.x, old_point.y, old_point.value)
    move(direction, point, 1)
    point.value = adjacent_value(point)
    taken_steps += 1
    SPACE[[point.x, point.y]] = point.value
    if point.value > goal
      return point
    end
    if steps == taken_steps
      new_steps = if !first
        steps + 1
      else
        steps
      end
      new_direction = next_direction(direction)
      step(new_steps, point, new_direction, goal, !first, 0)
    else
      step(steps, point, direction, goal, first, taken_steps)
    end
  end

  def turn?(point, steps, direction)
    if direction == Direction::UP || direction == Direction::DOWN
      point.y.abs == steps
    else
      point.x.abs == steps
    end
  end

  def adjacent_value(point)
    values = [
      SPACE[[point.x - 1, point.y]],
      SPACE[[point.x + 1, point.y]],
      SPACE[[point.x, point.y - 1]],
      SPACE[[point.x, point.y + 1]],
      SPACE[[point.x - 1, point.y + 1]],
      SPACE[[point.x + 1, point.y - 1]],
      SPACE[[point.x - 1, point.y - 1]],
      SPACE[[point.x + 1, point.y + 1]],
    ]
    values.compact.inject(0, :+)
  end
end
