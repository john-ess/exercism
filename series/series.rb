class Series
  def initialize num
    raise ArgumentError.new('Numbers only.') if num =~ /\D/
    @num = num
  end

  def slices series_length
    raise ArgumentError.new("'#{@num}' is shorter than #{series_length}") if series_length > @num.length
    # break into array of characters
    #   get each consecutive set given number of chars
    #     join the individual chars in that set
    #       map the result to a returned array
    @num.chars.each_cons(series_length).map(&:join)
  end
end
