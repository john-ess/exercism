
class School

  def initialize
    @roster = Hash.new {|hash, key| hash[key] = [] }
  end

  def add student, grade
    @roster[grade] << student
  end

  def students grade
    @roster[grade].sort
  end

  def students_by_grade
    @roster.sort.map do |grade, students|
      { grade: grade, students: students.sort }
    end
  end

end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
