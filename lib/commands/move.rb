class Move
  def self.call(...)
    new(...).call
  end

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def call
    return unless @robot.on_table?
    return unless @table.valid_position?(*target_position)

    @robot.set_position!(*target_position)
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
    else
      position[:x] -= 1
    end

    @target_position ||= position.values
  end
end
