class Report
  def self.call(...)
    new(...).call
  end

  def initialize(robot)
    @robot = robot
  end

  def call
    return unless @robot.on_table?

    puts [@robot.x_position, @robot.y_position, @robot.direction].join(",")
  end
end