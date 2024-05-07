class Table
  HEIGHT = 5.freeze
  WIDTH = 5.freeze
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_reader :height, :width

  def initialize
    @height = HEIGHT
    @width = WIDTH
  end

  def valid_position?(x, y, direction)
    valid_x?(x) && valid_y?(y) && valid_direction?(direction)
  end

  private

  def valid_x?(x)
    (0..@width-1).include?(x)
  end

  def valid_y?(y)
    (0..@height-1).include?(y)
  end

  def valid_direction?(direction)
    DIRECTIONS.include?(direction)
  end
end
