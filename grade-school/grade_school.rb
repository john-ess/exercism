# UGLY, but it works
# need to delve more into hashes
# needs a private method

class School

  def initialize
    @roster = []
  end

  def add student, year
    if @roster.select{ |x| x[:grade] == year}.empty?
      h = {grade: year, students: [student]}
      @roster.push(h)
    else
      r = @roster.select{ |x| x[:grade] == year}
      r[0][:students] << student
      r[0][:students].sort!
    end
    return student
  end

  def students year
    return [] if @roster.empty? || @roster.select{ |x| x[:grade] == year}.nil?
    s = @roster.select{ |x| x[:grade] == year}
    s[0][:students]
  end

  def students_by_grade
    @roster.sort_by{|h| h[:grade] }
  end

end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
