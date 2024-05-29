class StringProcessor
  # Main method to add numbers in a string
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter_and_numbers(numbers)

    # Split the numbers using the delimiter, convert them to integers
    nums = numbers.split(delimiter).map(&:to_i)

    check_for_negatives(nums)

    # Return the sum of the numbers
    nums.sum
  end

  private

  # Method to extract delimiter and numbers from the input string
  def self.extract_delimiter_and_numbers(numbers)

    if numbers.start_with?('//')
      header, numbers = numbers.split("\n", 2)

      delimiters = extract_custom_delimiters(header)
      # Return the delimiter and numbers
      [Regexp.union(delimiters), numbers]
    else
      # If no custom delimiter is specified, use default delimiters (comma or newline)
      [/[,|\n]/, numbers]
    end
  end

  # Method to extract custom delimiters from the header
  def self.extract_custom_delimiters(header)

    if header.include?('[')
      # Extract custom delimiters enclosed in square brackets
      header.scan(/\[(.*?)\]/).flatten
    else
      # Extract single custom delimiter
      [header[2..-1]]
    end
  end

  # Method to check for negative numbers and raise an exception if any are found
  def self.check_for_negatives(nums)
    negatives = nums.select { |num| num < 0 }

    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
