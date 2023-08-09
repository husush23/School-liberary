require_relative '../lib/student'
require_relative '../lib/classroom'

describe Student do
  let(:classroom) { instance_double(Classroom, students: []) }
  let(:age) { 18 }
  let(:name) { 'Alice' }
  let(:parent_permission) { true }
  let(:student) { Student.new(classroom, age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'creates a student with the provided age' do
      expect(student.age).to eq(age)
    end
    it 'creates a student with the provided name' do
      expect(student.name).to eq(name)
    end
    it 'creates a student with the provided parent perssion' do
      expect(student.parent_permission).to eq(parent_permission)
    end
    it 'creates a student with the provided class' do
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#classroom=' do
    it 'sets the classroom ' do
      new_classroom = instance_double(Classroom, students: [])
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
    it 'adds the student to the classroom' do
      new_classroom = instance_double(Classroom, students: [])
      student.classroom = new_classroom
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#play hooky' do
    it 'it displays some play message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
