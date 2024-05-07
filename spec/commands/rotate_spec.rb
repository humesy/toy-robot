RSpec.describe Rotate do
  let(:robot) { Robot.new }

  describe ".call" do
    context "when robot is not on table" do
      it "does nothing" do
        described_class.call(robot, "RIGHT")

        expect(robot.direction).to be_nil
      end
    end

    context "when robot is on table" do
      context "with invalid direction" do
        it "does not rotate the robot" do
          robot.set_position!(1, 2, "EAST")

          described_class.call(robot, "BAD_DIRECTION")

          expect(robot.direction).to eq "EAST"
        end
      end

      context "with RIGHT direction" do
        it "rotates the robot NORTH to EAST" do
          robot.set_position!(1, 2, "NORTH")

          described_class.call(robot, "RIGHT")

          expect(robot.direction).to eq "EAST"
        end

        it "rotates the robot EAST to SOUTH" do
          robot.set_position!(1, 2, "EAST")

          described_class.call(robot, "RIGHT")

          expect(robot.direction).to eq "SOUTH"
        end

        it "rotates the robot SOUTH to WEST" do
          robot.set_position!(1, 2, "SOUTH")

          described_class.call(robot, "RIGHT")

          expect(robot.direction).to eq "WEST"
        end

        it "rotates the robot WEST to NORTH" do
          robot.set_position!(1, 2, "WEST")

          described_class.call(robot, "RIGHT")

          expect(robot.direction).to eq "NORTH"
        end
      end

      context "with LEFT direction" do
        it "rotates the robot NORTH to WEST" do
          robot.set_position!(1, 2, "NORTH")

          described_class.call(robot, "LEFT")

          expect(robot.direction).to eq "WEST"
        end

        it "rotates the robot EAST to NORTH" do
          robot.set_position!(1, 2, "EAST")

          described_class.call(robot, "LEFT")

          expect(robot.direction).to eq "NORTH"
        end

        it "rotates the robot SOUTH to EAST" do
          robot.set_position!(1, 2, "SOUTH")

          described_class.call(robot, "LEFT")

          expect(robot.direction).to eq "EAST"
        end

        it "rotates the robot WEST to SOUTH" do
          robot.set_position!(1, 2, "WEST")

          described_class.call(robot, "LEFT")

          expect(robot.direction).to eq "SOUTH"
        end
      end
    end
  end
end
