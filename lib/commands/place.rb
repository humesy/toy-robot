##
# Places the robot on the table at the provided position and direction
#
# If either the position or direction is not valid, the robot will not
# be placed
#
# ==== Attributes
#
# * +robot+ - The robot object that is being placed
# * +table+ - The table object that the robot is being placed on
# * +x_position+ - The x coordinate of the table to place the robot on
# * +y_position+ - The y coordinate of the table to place the robot on
# * +direction+ - The direction to place the robot facing

class Place
  def self.call(...)
    new(...).call
  end

  def initialize(robot, table, x_position, y_position, direction)
    @robot = robot
    @table = table
    @x_position = x_position.to_i
    @y_position = y_position.to_i
    @direction = direction
  end

  def call
    return unless @table.valid_position?(@x_position, @y_position)
    return unless @table.valid_direction?(@direction)

    @robot.set_position!(@x_position, @y_position)
    @robot.set_direction!(@direction)
  end
end