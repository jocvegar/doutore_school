class StudentCreator
  def initialize(form)
    @form = form
  end

  def call
    student = Student.where(email: @form.email).first_or_initialize
    student.first_name = @form.first_name
    student.last_name = @form.last_name
    student.date_of_birth = @form.date_of_birth
    student.save
  end
end
