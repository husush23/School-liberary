require_relative '../lib/teacher'

describe Teacher do
  let(:specialization) { 'Mathematics' }
  let(:age) { 30 }
  let(:name) { 'Mr. Smith' }
  let(:parent_permission) { true }
  let(:teacher) { Teacher.new(specialization, age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'creates a teacher with the provided specialization' do
      expect(teacher.specialization).to eq(specialization)
    end
    it 'creates a teacher with the provided age' do
      expect(teacher.age).to eq(age)
    end
    it 'creates a teacher with the provided name' do
      expect(teacher.name).to eq(name)
    end
    it 'creates a teacher with the provided parent permission' do
      expect(teacher.parent_permission).to eq(parent_permission)
    end
  end

  describe '#can_use_services?' do
    it 'returns true, overriding the parent method' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
