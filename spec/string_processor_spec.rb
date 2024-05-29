require 'rspec'
require_relative '../lib/string_processor'

RSpec.describe StringProcessor do

  describe '.sum' do
    it 'returns 0 for an empty string' do
      expect(StringProcessor.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(StringProcessor.add("1")).to eq(1)
    end

    it 'returns the sum of two comma-separated numbers' do
      expect(StringProcessor.add("1,5")).to eq(6)
    end

    it 'returns the sum of multiple comma-separated numbers' do
      expect(StringProcessor.add("1,2,3,4")).to eq(10)
    end

    it 'supports different delimiters' do
      expect(StringProcessor.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      expect { StringProcessor.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
    end

    it 'raises an exception for multiple negative numbers' do
      expect { StringProcessor.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
    end

    it 'handles custom delimiter of any length' do
      expect(StringProcessor.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'handles multiple custom delimiters' do
      expect(StringProcessor.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'handles custom delimiter with special characters and any length' do
      expect(StringProcessor.add("//[***]|[$$$]\n1***2$$$3")).to eq(6)
    end
  end
end
