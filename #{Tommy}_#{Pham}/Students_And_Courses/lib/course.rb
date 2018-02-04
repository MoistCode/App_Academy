class Course
  attr_reader :name, :department, :credits, :student_list, :days, :time_block

  def initialize(name, department, credits, days = [], time_block = 0)
    @name = name
    @department = department
    @credits = credits
    @days = days
    @time_block = time_block
    @student_list = []
  end

  def students
    student_list
  end

  def add_student(student_name)
    student_name.enroll(self)
  end

  def conflicts_with?(course_name)
    conflict = false
    self.days.each do |el|
      course_name.days.each do |el2|
        if el == el2 && self.time_block == course_name.time_block
          conflict = true
          break
        end
      end
    end
    conflict
  end


end
