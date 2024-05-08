##
# Rotates the direction the robot is facing left or right
#
# If the robot is not on the table or an invalid rotation direction
# is provided, does not attempt to rotate the robot
#
# ==== Attributes
#
# * +robot+ - The robot object that is being rotated
# * +rotation+ - The direction to rotate the robot

class Rotate
  VALID_ROTATION = %w[LEFT RIGHT].freeze

  def self.call(...)
    new(...).call
  end

  def initialize(robot, rotation)
    @robot = robot
    @rotation = rotation
  end

  def call
    return unless @robot.on_table?
    return unless VALID_ROTATION.include?(@rotation)

    @robot.set_direction!(target_direction)
  end

  private

  def target_direction
    directions = Table::DIRECTIONS.dup * 2
    new_index = directions.index(@robot.direction) + direction_shift
    directions[new_index]
  end

  def direction_shift
    @rotation == "LEFT" ? -1 : 1
  end
end
