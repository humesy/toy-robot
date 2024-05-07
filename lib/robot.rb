class Robot
  attr_accessor :x_position, :y_position, :direction

  def initialize
    @x_position = nil
    @y_position = nil
    @direction = nil
  end

  def set_position!(new_x, new_y, new_direction)
    @x_position = new_x
    @y_position = new_y
    @direction = new_direction
  end

  def on_table?
    [@x_position, @y_position, @direction].none?(&:nil?)
  end
end
