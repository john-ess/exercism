# UGLY, but it works
# a bit cleaned up...

class School

  def initialize
    @roster = []
  end

  def add student, grade
    if @roster.select{ |h| h[:grade] == grade}.empty?
      grade = { grade: grade, students: [student] }
      @roster.push(grade)
    else
      grade = @roster.select{ |x| x[:grade] == grade}
      grade.first[:students] << student
      grade.first[:students].sort!
    end
  end

  def students grade
    return [] if @roster.select{ |h| h[:grade] == grade}.empty?
    @roster.select{ |h| h[:grade] == grade }.first[:students]
  end

  def students_by_grade
    @roster.sort_by{ |h| h[:grade] }
  end

end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
