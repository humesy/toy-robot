##
# Logs the current position and direction of the robot to standard output
#
# If the robot is not on the table, does not output anything
#
# ==== Attributes
#
# * +robot+ - The robot object to report position and direction of

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