
class School

  def initialize
    @roster = Hash.new {|hash, key| hash[key] = [] }
  end

  def add student, grade
    return @roster[grade] = [student] if @roster[grade].empty?

    @roster[grade] << student
    @roster[grade].sort!
  end

  def students grade
    return [] if @roster[grade].nil?
    @roster[grade]
  end

  def students_by_grade
    return [] if @roster.empty?
    @roster.sort.map { |k,v| { :grade => k, :students => v } }
  end

end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
