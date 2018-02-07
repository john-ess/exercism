class Bst

  def initialize num
    @start_num = num
    @all_data  = Array.new << num
  end

  def data num = @start_num
    i = find_position num
    return @all_data[i]
  end

  def find_position num
    @all_data.index(num)
  end

  def insert num

  end

end
