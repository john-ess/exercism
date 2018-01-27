class Series
  def initialize num
    raise ArgumentError.new('Numbers only.') if num =~ /\D/
    @num = num
  end

  def slices series_length
    raise ArgumentError.new("#{series_length} > #{@num.length}") if series_length > @num.length
    @num.chars.each_cons(series_length).map { |set| set.join }
  end
end
