class PersonFactory
  def create_student(id, name, age, parent_permission, classroom)
    Student.new(id, name, age, parent_permission, classroom)
  end

  def create_teacher(id, name, age, specialization)
    Teacher.new(id, name, age, specialization)
  end
end
