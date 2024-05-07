class Move
  def self.call(...)
    new(...).call
  end

  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def call
    return unless @robot.on_table?
    new_position = target_position + [@robot.direction]
    return unless @table.valid_position?(*new_position)

    @robot.set_position!(*new_position)
  end

  private

  def target_position
    position = {
      x: @robot.x_position,
      y: @robot.y_position
    }

    case @robot.direction
    when "NORTH"
      position[:y] += 1
    when "EAST"
      position[:x] += 1
    when "SOUTH"
      position[:y] -= 1
    when "WEST"
      position[:x] -= 1
    end

    position.values
  end
end
