class Place
  def self.call(...)
    new(...).call
  end

  def initialize(table, robot, x_position, y_position, direction)
    @table = table
    @robot = robot
    @x_position = x_position.to_i
    @y_position = y_position.to_i
    @direction = direction
  end

  def call
    return unless @table.valid_position?(@x_position, @y_position, @direction)

    @robot.set_position!(@x_position, @y_position, @direction)
  end
end