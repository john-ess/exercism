class FlattenArray
  def self.flatten the_array
    the_array.each_with_object([]) do |item, flattened|
      case item
      when NilClass
        next
      when Array
        flatten(item).each_with_object(flattened) { |nested_item| flattened << nested_item }
      else
        flattened << item
      end
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
