# UGLY, but it works
# a bit cleaned up...

class School

  def initialize
    @roster = []
  end

  def add student, year
    if @roster.select{ |x| x[:grade] == year}.empty?
      year = { grade: year, students: [student] }
      @roster.push(year)
    else
      year = @roster.select{ |x| x[:grade] == year}
      year.first[:students] << student
      year.first[:students].sort!
    end
  end

  def students year
    return [] if @roster.select{ |h| h[:grade] == year}.empty?
    @roster.select{ |h| h[:grade] == year }.first[:students]
  end

  def students_by_grade
    @roster.sort_by{ |h| h[:grade] }
  end

end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
