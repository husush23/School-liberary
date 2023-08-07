require_relative 'student'
require_relative 'teacher'

class PersonFactory
    def create_student(age, name, parent_permission, classroom)
      Student.new(age: age, name: name, parent_permission: parent_permission, classroom: classroom)
    end
     
    def create_teacher(age, name, specialization)
      Teacher.new(age:age, name:name, specialization:specialization)
    end
  end