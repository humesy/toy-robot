class Robot
  attr_accessor :x_position, :y_position, :direction

  def initialize
    @x_position = nil
    @y_position = nil
    @direction = nil
  end

  def set_position!(new_x, new_y)
    @x_position = new_x
    @y_position = new_y
  end

  def set_direction!(new_direction)
    @direction = new_direction
  end

  def on_table?
    [@x_position, @y_position, @direction].none?(&:nil?)
  end
end
