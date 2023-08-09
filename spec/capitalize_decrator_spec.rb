require_relative '../lib/capitalize_decrator'

describe CapitalizeDecorator do
  let(:nameable) { instance_double(Nameable, correct_name: 'john doe') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct name returned by the wrapped object' do
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
