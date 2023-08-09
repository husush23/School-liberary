require_relative "../lib/classroom"

describe Classroom do
    let(:label) { 'Mathematics' }
    let(:classroom) { Classroom.new(label) }
    let(:student) { instance_double(Student) }  # Assuming you have a Student class
  
    describe '#initialize' do
      it 'creates a classroom with the provided label' do
        expect(classroom.label).to eq(label)
      end
  
      it 'initializes an empty array of students' do
        expect(classroom.students).to be_empty
      end
    end

    describe '#add_student' do
        it 'adds a student to the classroom and sets the classroom for the student' do
          allow(student).to receive(:classroom=)  
          classroom.add_student(student)
          expect(classroom.students).to include(student)
          expect(student).to have_received(:classroom=).with(classroom)  
        end
      end
end