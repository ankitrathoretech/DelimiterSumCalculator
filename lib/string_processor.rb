class StringProcessor
  # Main method to add numbers in a string
  def self.add(numbers)
    return 0 if numbers.empty?

    numbers.split(",").map(&:to_i).sum
  end
end
