RSpec.describe Report do
  let(:robot) { Robot.new }

  describe ".call" do
    context "when robot is not on table" do
      it "does nothing" do
        expect(STDOUT).to_not receive(:puts)

        described_class.call(robot)
      end
    end

    context "when robot is on table" do
      before do
        robot.set_position!(1, 2)
        robot.set_direction!('NORTH')
      end

      it "outputs current position of robot" do
        expect(STDOUT).to receive(:puts).with("1,2,NORTH")

        described_class.call(robot)
      end
    end
  end
end
