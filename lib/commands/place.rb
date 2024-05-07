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