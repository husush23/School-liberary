require_relative "student"

class Claasroom
    attr_accessor :label, :students

    def  initialize(label)
        @label = label
        @students = []
    end
    
    def add_student(student)
        @students << student
        student.classroom = self
end