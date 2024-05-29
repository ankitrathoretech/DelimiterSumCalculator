class StringProcessor
  # Main method to add numbers in a string
  def self.add(numbers)
    return 0 if numbers.empty?

    nums = numbers.split(",").map(&:to_i)

    check_for_negatives(nums)

    # Return the sum of the numbers
    nums.sum
  end

  private

  # Method to check for negative numbers and raise an exception if any are found
  def self.check_for_negatives(nums)
    negatives = nums.select { |num| num < 0 }

    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
