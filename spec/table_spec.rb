RSpec.describe Table do
  let(:table) { Table.new }
  let(:valid_x) { 1 }
  let(:valid_y) { 1 }
  let(:valid_direction) { 'WEST' }

  describe "#initialize" do
    it "initializes with height and width" do
      expect(table.height).to eq 5
      expect(table.width).to eq 5
    end
  end

  describe "#valid_position?" do
    context "when invalid" do
      context "width" do
        it "returns false if too low" do
          expect(table.valid_position?(-1, valid_y)).to be_falsey
        end

        it "returns false if too high" do
          expect(table.valid_position?(6, valid_y)).to be_falsey
        end
      end

      context "height" do
        it "returns false if too low" do
          expect(table.valid_position?(valid_x, -1)).to be_falsey
        end

        it "returns false if too high" do
          expect(table.valid_position?(valid_x, 6)).to be_falsey
        end
      end
    end

    context "when valid" do
      it "returns true" do
        expect(table.valid_position?(valid_x, valid_y)).to be_truthy
      end
    end
  end

  describe "#valid_direction?" do
    context "when invalid" do
      it "returns false" do
        expect(table.valid_direction?("BAD_DIRECTION")).to be_falsey
      end
    end

    context "when valid" do
      it "returns true" do
        expect(table.valid_direction?(valid_direction)).to be_truthy
      end
    end
  end
end
