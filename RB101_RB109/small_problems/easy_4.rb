require 'pry'

# Question 1
# Short Long Short
# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter 
# string, the longer string, and the shorter string once again. You may assume 
# that the strings are of different lengths.

def short_long_short(str1, str2)
  return str1.length < str2.length ? 
    str1 + str2 + str1
    : str2 + str1 + str2
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
  
# Question 2
# What Century is That?
# Write a method that takes a year as input and returns the century. The return 
# value should be a string that begins with the century number, and ends with 
# st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise 
# the 20th century.

def century(year)
  cent = year / 100
  
  cent += 1 if year % 100 != 0
  
  if (cent % 100).between?(10,14)
    return cent.to_s + "th"
  end
  
  case cent % 10
  when 1
    return cent.to_s + "st"
  when 2
    return cent.to_s + "nd"
  when 3
    return cent.to_s + "rd"
  else
    return cent.to_s + "th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# Question 3
# Leap Years (Part 1)
# In the modern era under the Gregorian Calendar, leap years occur in every year
# that is evenly divisible by 4, unless the year is also divisible by 100. If 
# the year is evenly divisible by 100, then it is not a leap year unless the year 
# is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method 
# that takes any year greater than 0 as input, and returns true if the year is a 
# leap year, or false if it is not a leap year.

def leap_year?(year)
  return year % 100 == 0 && year % 400 != 0 ?
    false
    : year % 4 == 0 ? true : false
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# Question 4
# Leap Years (Part 2)
# A continuation of the previous exercise.

# The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. 
# Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap
# years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to 
# determine leap years both before and after 1752.

def leap_year?(year)
  if year >= 1752
    return year % 100 == 0 && year % 400 != 0 ?
      false
      : year % 4 == 0 ? true : false
  else
    return year % 4 == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Question 5
# Multiples of 3 and 5
# Write a method that searches for all multiples of 3 or 5 that lie between 1 
# and some other number, and then computes the sum of those multiples. For 
# instance, if the supplied number is 20, the result should be 
# 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
# 
# You may assume that the number passed in is an integer greater than 1.

def multisum(num)
  sum = 0
  (num+1).times {|n|
    if n % 3 == 0 || n % 5 == 0
      sum += n
    end
  }
  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# Question 6
# Running Totals
# Write a method that takes an Array of numbers, and returns an Array with the 
# same number of elements, and each element has the running total from the
# original Array.

def running_total(arr)
  sum = 0
  arr.map {|n|
    sum += n
  }
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Question 7
# Convert a String to a Number!
# The String#to_i method converts a string of numeric characters (including an 
# optional plus or minus sign) to an Integer. String#to_i and the Integer 
# constructor (Integer()) behave similarly. In this exercise, you will create a 
# method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate 
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about 
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. Your method should do this the
# old-fashioned way and calculate the result by analyzing the characters in the
# string.

def string_to_integer(str)
  digits = {
    '1'=>1,'2'=>2,'3'=>3,'4'=>4,'5'=>5,'6'=>6,'7'=>7,'8'=>8,'9'=>9,'0'=>0
  }
  
  str_in_num = str.split('').reverse
  num = 0
  str_in_num.each_index {|n|
    num_here = digits[str_in_num[n]]
    num_here *= (10 ** n)
    
    num += num_here
  }
  
  num
end

p string_to_integer('4321')
p string_to_integer('570') == 570

# Question 8
# Convert a String to a Signed Number!
# In the previous exercise, you developed a method that converts simple numeric
# strings to Integers. In this exercise, you're going to extend that method to 
# work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate 
# number as an integer. The String may have a leading + or - sign; if the first
# character is a +, your method should return a positive number; if it is a -, 
# your method should return a negative number. If no sign is given, you should
# return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such 
# as String#to_i, Integer(), etc. You may, however, use the string_to_integer
# method from the previous lesson.

def string_to_signed_integer(str)
  neg = false
  if str.start_with?(/[\+\-]/)
    if str[0] == '-'
      neg = true
    end
    
    str[0] = ''
  end
  
  num = string_to_integer(str)
  if neg 
    return -num
  else
    num
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# Question 9
# Convert a Number to a String!
# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're 
# going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

# You may not use any of the standard conversion methods available in Ruby, 
# such as Integer#to_s, String(), Kernel#format, etc. Your method should do 
# this the old-fashioned way and construct the string by analyzing and
# manipulating the number.

def integer_to_string(num)
  str_digits = ['0','1','2', '3','4','5','6','7','8','9']
  
  new_str = ''
  
  loop {
    new_str << str_digits[num % 10]
    num /= 10
    break if num % 10 == 0 && num / 10 == 0
  }
  
  new_str.reverse
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Question 10
# Convert a Signed Number to a String!
# In the previous exercise, you developed a method that converts non-negative 
# numbers to strings. In this exercise, you're going to extend that method by 
# adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such
# as Integer#to_s, String(), Kernel#format, etc. You may, however, use 
# integer_to_string from the previous exercise.

def signed_integer_to_string(num)
  return num == 0 ? 
    integer_to_string(num)
    : num < 0 ?
      '-' + integer_to_string(num*-1)
      : '+' + integer_to_string(num)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'