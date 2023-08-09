require_relative '../lib/person'

describe Person do
  let(:age) { 25 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:person) { Person.new(age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'Reutns the correct parent perssion' do
      expect(person.parent_permission).to eq(parent_permission)
    end

    it 'creates an age' do
      expect(person.age).to eq(age)
    end

    it 'creates a person name with corerct argument' do
      expect(person.name).to eq(name)
    end

    it 'has a random ID' do
      expect(person.id).to be_a(Integer)
    end
  end
end
