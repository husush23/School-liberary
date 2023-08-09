require_relative '../lib/base_decorator'  # Adjust the path to the actual path of your class

describe BaseDecorator do
  let(:nameable) { instance_double(Nameable) }
  let(:decorator) { BaseDecorator.new(nameable) }

  describe '#correct_name' do
    it "delegates to the wrapped nameable's correct_name method" do
      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
