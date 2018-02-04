class Student
  attr_reader :first_name, :last_name, :course_list

  def initialize (first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @course_list = []
  end

  def name
    return "#{@first_name} #{@last_name}"
  end

  def courses
    @course_list
  end

  def enroll(new_course)
    courses.each do |el|
      if el.conflicts_with?(new_course)
        return raise "Conflicting course"
      end
    end
    self.courses << new_course if self.courses.none?{|el| el == new_course}
    new_course.students << self
  end

  def course_load
    hsh = Hash.new(0)
    self.courses.each do |course|
      hsh[course.department] += course.credits
    end
    hsh
  end

end
