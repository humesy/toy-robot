RSpec.describe Place do
  let(:robot) { Robot.new }
  let(:table) { Table.new }

  describe ".call" do
    context "when placement is invalid" do
      it "does not update position of the robot" do
        described_class.call(table, robot, -1, 2, 'WEST')

        expect(robot.x_position).to be_nil
        expect(robot.y_position).to be_nil
        expect(robot.direction).to be_nil
      end
    end

    context "when placement is valid" do
      it "updates position of robot" do
        described_class.call(table, robot, 1, 2, 'WEST')

        expect(robot.x_position).to eq 1
        expect(robot.y_position).to eq 2
        expect(robot.direction).to eq 'WEST'
      end
    end
  end
end
