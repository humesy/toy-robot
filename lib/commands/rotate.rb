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
    directions = Table::DIRECTIONS.dup
    directions.reverse! if @rotation == "RIGHT"
    current_index = directions.index(@robot.direction)
    directions[current_index -1]
  end
end
