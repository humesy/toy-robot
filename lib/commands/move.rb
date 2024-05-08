##
# Moves the robot 1 unit in the direction it is currently facing
#
# If the robot is not on the table or the move would take it off the
# table, does not attempt to move the robot
#
# ==== Attributes
#
# * +robot+ - The robot object that is being moved
# * +table+ - The table object that the robot is being moved on

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
