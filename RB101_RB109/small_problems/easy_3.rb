# Question 1
# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5 numbers.

def q1_get_num
  puts "Enter a number please: "
  gets.to_i
end

q1_user_arr = []

5.times {
  q1_user_arr << q1_get_num
}

q1_last_num = q1_get_num

if q1_user_arr.include?(q1_last_num)
  puts "#{q1_last_num} is inside of #{q1_user_arr}"
else
  puts "#{q1_last_num} is not inside of #{q1_user_arr}"
end

# Question 2
# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers: addition, 
# subtraction, product, quotient, remainder, and power. Do not worry about 
# validating the input.

puts "\n======== Question 2 ==========="
q2_first_num = q1_get_num
q2_sec_num = q1_get_num

puts "#{q2_first_num} + #{q2_sec_num} = #{q2_first_num + q2_sec_num}"
puts "#{q2_first_num} - #{q2_sec_num} = #{q2_first_num - q2_sec_num}"
puts "#{q2_first_num} * #{q2_sec_num} = #{q2_first_num * q2_sec_num}"
puts "#{q2_first_num} / #{q2_sec_num} = #{q2_first_num / q2_sec_num}"
puts "#{q2_first_num} % #{q2_sec_num} = #{q2_first_num % q2_sec_num}"
puts "#{q2_first_num} ** #{q2_sec_num} = #{q2_first_num ** q2_sec_num}"

# Question 3
# Write a program that will ask a user for an input of a word or multiple words 
# and give back the number of characters. Spaces should not be counted as a 
# character.

puts "Please enter a word or sentence: "
q3_string = gets.chomp

puts "There are #{q3_string.split(" ").join.length} characters in: #{q3_string}"

# Question 4
# Create a method that takes two arguments, multiplies them together, and
# returns the result.

def multiply(first_num, second_num)
  first_num * second_num
end

puts multiply(3,5) == 15

# Question 5
# Using the multiply method from the "Multiplying Two Numbers" problem, write a 
# method that computes the square of its argument (the square is the result of
# multiplying a number by itself).

def square(num)
  multiply(num, num)
end

puts square(5)

# Question 6
# The || operator returns a truthy value if either or both of its operands are 
# truthy, a falsey value if both operands are falsey. The && operator returns a
# truthy value if both of its operands are truthy, and a falsey value if either
# operand is falsey. This works great until you need only one of two conditions 
# to be truthy, the so-called exclusive or.

# In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is truthy, false otherwise.

def xor?(arg_1, arg_2)
  if (arg_1 && arg_2) 
    return false
  elsif (arg_1 || arg_2)
    return true
  else
    return false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# cleaner version
def xor?(value1, value2)
  (value1 && !value2) || (value2 && !value1)
end

# Question 7
# Write a method that returns an Array that contains every other element of an 
# Array that is passed in as an argument. The values in the returned list should 
# be those values that are in the 1st, 3rd, 5th, and so on elements of the
# argument Array.

def q7_other_arr(arry)
  arry_out = []
  arry.each_index { |i| arry_out << arry[i] if i.even? }
  arry_out
end

puts q7_other_arr([2, 3, 4, 5, 6])
puts q7_other_arr([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts q7_other_arr(['abc', 'def']) == ['abc']

# Question 8
# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward. 
# For this exercise, case matters as does punctuation and spaces.

def q8_palindrome?(str)
  str == str.reverse
end

puts q8_palindrome?('madam') == true
puts q8_palindrome?('Madam') == false          # (case matters)
puts q8_palindrome?("madam i'm adam") == false # (all characters matter)
puts q8_palindrome?('356653') == true

# Question 9
# Write another method that returns true if the string passed as an argument is 
# a palindrome, false otherwise. This time, however, your method should be 
# case-insensitive, and it should ignore all non-alphanumeric characters. If you
# wish, you may simplify things by calling the palindrome? method you wrote in 
# the previous exercise.

def q9_palindrome?(str)
  str_here = str.downcase.gsub(/\W+/,'')
  # alternatively, str.downcase.delete('^a-z0-9')
  q8_palindrome?(str_here)
end

puts q9_palindrome?('madam') == true
puts q9_palindrome?('Madam') == true           # (case does not matter)
puts q9_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts q9_palindrome?('356653') == true
puts q9_palindrome?('356a653') == true
puts q9_palindrome?('123ab321') == false

# Question 10
# Write a method that returns true if its integer argument is palindromic, 
# false otherwise. A palindromic number reads the same forwards and backwards.

def q10_palindromic?(num)
  q9_palindrome?(num.to_s)
end

puts q10_palindromic?(34543) == true
puts q10_palindromic?(123210) == false
puts q10_palindromic?(22) == true
puts q10_palindromic?(5) == true