require 'rspec'


class StringCalculator

  def self.add(input)
    # input.split(",").map(&:to_i).inject(0) { |sum, x| sum + x }
    #input.split(",").map(&:to_i).sum
    input.split(",").map(&:to_i).inject(0,:+)


    #sum = 0
    #input.split(",").each do |x|
    #  sum += x.to_i
    #end
    #sum
  end

  def self.multiply(input)
    # input.split(",").map(&:to_i).inject(1) { |product, x| product * x }
    input.split(",").map(&:to_i).inject(:*)
    #product = 1
    #input.split(",").each do |x|
    #  product *= x.to_i
    #end
    #product
  end

  def self.greater_than_or_equal_to_zero(input)
    if input.to_i >= 0
      true
    else
      false
    end
  end

  def self.return_last_element(input)
    input[-1]
  end

  def self.calculate(input)
    operator = input.split(/\,|\|/).shift
    if operator == "+"
      input.split(/\,|\|/).map(&:to_i).inject(0,:+)
    elsif operator == "-"
      input.split(/\,|\|/).map(&:to_i).inject(0,:-)
    else operator == "*"
      input.split(/\,|\|/)[1..-1].map(&:to_i).inject(:*)
    end
  end


end

RSpec.describe StringCalculator do
  it 'returns 0 for empty string' do
    result = StringCalculator.add('')

    expect(result).to eq(0)
  end

  it 'returns the number it receives' do
    result = StringCalculator.add('2')

    expect(result).to eq(2)
  end

  it 'returns the number it receives' do
    result = StringCalculator.add('1,2,3,4')

    expect(result).to eq(10)
  end

  it 'returns the sum of two numbers' do
    result = StringCalculator.add('1,2')

    expect(result).to eq(3)
  end

  it 'returns the product of two numbers' do
    result = StringCalculator.multiply('1,2')

    expect(result).to eq(2)
  end

  it 'returns the sum of two numbers with operator' do
    result = StringCalculator.calculate('+,1,2')

    expect(result).to eq(3)
  end

  it 'returns the product of three numbers with operator' do
    result = StringCalculator.calculate('*,1,2,3')

    expect(result).to eq(6)
  end

  it 'returns the difference of numbers with operator' do
    result = StringCalculator.calculate('-,1,2,3')

    expect(result).to eq(-1)
  end

  it 'uses the provided separator' do
    result = StringCalculator.calculate('+|1|2|3')

    expect(result).to eq(6)
  end

  it 'returns true if input is greater than or equal to 0' do
    result = StringCalculator.greater_than_or_equal_to_zero('5')

    expect(result).to be true
  end

  it 'returns last element from the array' do
    result = StringCalculator.return_last_element([6, 22, 84])

    expect(result).to eq(84)
  end
end
