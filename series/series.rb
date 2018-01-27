class Series
  def initialize num
    raise ArgumentError.new('Numbers only.') if num =~ /\D/
    @num = num
  end

  def slices series_length
    raise ArgumentError.new("#{series_length} > #{@num.length}") if series_length > @num.length
    num = @num.dup
    arr = []
    begin
      arr << num.slice(0,series_length)
      num.slice!(0)
    end while !num.empty? && num.length >= series_length
    arr
  end
end
