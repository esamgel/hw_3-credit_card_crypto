module LuhnValidator
  # frozen_string_literal: true
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    cred_num = []
    nums_a.each do |i|
      cred_num.push(i.to_i)
    end

    # Luhn algorithms
    # first sum the odd positioned numbers
    # then sum the doubles of even postioned numbers
    # with two digit values added together instead.
    sum_odd = 0
    sum_doubled_even = 0
    position = cred_num.size

    cred_num.each do |val|
      if (position % 2).zero? # do this if position is even
        double_even = val * 2
        if double_even >= 10 # do this to 2 digit values(add them together)
          two_dig_dum = (double_even % 10) + (double_even / 10)
          sum_doubled_even += two_dig_dum
        else
          sum_doubled_even += double_even
        end
      else # do this if position is odd.
        sum_odd += val * 1
      end
      position -= 1 # decrement position
    end

    # Then check the if sums of the sum_odd and sum_doubled_even added
    # to a value divisible by 10
    return true if ((sum_doubled_even + sum_odd) % 10).zero?
    return false if ((sum_doubled_even + sum_odd) % 10) != 0
  end
end
