
class School

  def initialize
    @roster = Hash.new {|hash, key| hash[key] = [] }
  end

  def add student, grade
    @roster[grade] << student
    @roster[grade].sort!
  end

  def students grade
    @roster[grade]
  end

  def students_by_grade
    @roster.sort.map { |k,v| { :grade => k, :students => v.sort } }
  end

end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
