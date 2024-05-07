RSpec.describe Robot do
  let(:robot) { Robot.new }

  describe "#initialize" do
    it "initializes with no position values" do
      expect(robot.x_position).to be_nil
      expect(robot.y_position).to be_nil
      expect(robot.direction).to be_nil
    end
  end

  describe "#set_position!" do
    it "sets position values" do
      robot.set_position!(1, 2)

      expect(robot.x_position).to eq 1
      expect(robot.y_position).to eq 2
    end
  end

  describe "#set_direction!" do
    it "sets direction value" do
      robot.set_direction!('NORTH')

      expect(robot.direction).to eq 'NORTH'
    end
  end

  describe "#on_table?" do
    context "when robot does not have position values" do
      it "returns false" do
        expect(robot.on_table?).to be_falsey
      end
    end

    context "when robot has position and direction values" do
      it "returns true" do
        robot.set_position!(1, 2)
        robot.set_direction!('NORTH')

        expect(robot.on_table?).to be_truthy
      end
    end
  end
end
