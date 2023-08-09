class Preserve
  def create_student_json(person, person_type)
    {
      person_type: person_type,
      name: person.name,
      age: person.age,
      parent_permission: person.parent_permission,
      id: person.id
    }
  end

  def create_teacher_json(person, person_type)
    {
      person_type: person_type,
      name: person.name,
      age: person.age,
      specialization: person.specialization,
      id: person.id
    }
  end
end
