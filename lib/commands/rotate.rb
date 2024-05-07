class Rotate
  VALID_DIRECTIONS = %w[LEFT RIGHT].freeze

  def self.call(...)
    new(...).call
  end

  def initialize(robot, direction)
    @robot = robot
    @direction = direction
  end

  def call
    return unless @robot.on_table?
    return unless VALID_DIRECTIONS.include?(@direction)

    @robot.set_position!(@robot.x_position, @robot.y_position, target_direction)
  end

  private

  def target_direction
    directions = Table::DIRECTIONS.dup
    directions.reverse! if @direction == "RIGHT"
    current_index = directions.index(@robot.direction)
    directions[current_index -1]
  end
end
