# Question 1
# Welcome Stranger
# Create a method that takes 2 arguments, an array and a hash. The array will 
# contain 2 or more elements that, when combined with adjoining spaces, will 
# produce a person's name. The hash will contain two keys, :title and :occupation,
# and the appropriate values. Your method should return a greeting that uses the 
# person's full name, and mentions the person's title.

def greetings(name_arr, info_hash)
  name = name_arr.join(' ')
  title, occupation = info_hash.values
  
  puts "Hello, #{name}! It's nice to have a #{title} #{occupation} around!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Question 2
# Double Doubles
# A double number is a number with an even number of digits whose left-side 
# digits are exactly the same as its right-side digits. For example, 44, 3333,
# 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
# 
# Write a method that returns 2 times the number provided as an argument, unless
# the argument is a double number; double numbers should be returned as-is.

def double_double?(num)
  num_str = num.to_s
  if num_str.length.odd? 
    return false
  end
  half_point = num_str.length / 2
  num_str[0..half_point-1] == num_str[half_point..num_str.length]
end

def twice(num)
  return double_double?(num) ?
    num
    : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# Question 3
# Always Return Negative
# Write a method that takes a number as an argument. If the argument is a 
# positive number, return the negative of that number. If the number is 0 or 
# negative, return the original number.

def negative(num)
  return num <= 0 ?
    num
    : -num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# Question 4
puts "\n\nQuestion 4"
# Counting Up
# Write a method that takes an integer argument, and returns an Array of all 
# integers, in sequence, between 1 and the argument.
# 
# You may assume that the argument will always be a valid integer that is 
# greater than 0.

def sequence(num)
  num.times.map {|n| n + 1}
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Question 5
puts "\nQuestion 5"
# Uppercase Check
# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise. 
# Characters that are not alphabetic should be ignored.

def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Question 6
puts "\nQuestion 6"
# How long are you?
# Write a method that takes a string as an argument, and returns an Array that
# contains every word from the string, to which you have appended a space and 
# the word length.
# 
# You may assume that words in the string are separated by exactly one space, and
# that any substring of non-space characters is a word.

def word_lengths(str)
  str.split(' ').map {|word| "#{word} #{word.length}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
p word_lengths("") == []

# Question 7
puts "\nQuestion 7"
# Name Swapping
# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name, a 
# comma, a space, and the first name.

def swap_name(str)
  str.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# Question 8
puts "\nQuestion 8"
# Sequence Count
# Create a method that takes two integers as arguments. The first argument is a 
# count, and the second is the first number of a sequence that your method will 
# create. The method should return an Array that contains the same number of 
# elements as the count argument, while the values of each element will be
# multiples of the starting number.
# 
# You may assume that the count argument will always have a value of 0 or 
# greater, while the starting number can be any integer value. If the count is 0, 
# an empty list should be returned.

def sequence(count, num)
  count.times.map {|n| num * (n + 1) }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# Question 9
puts "\nQuestion 9"
# Grade book
# Write a method that determines the mean (average) of the three scores passed to
# it, and returns the letter value associated with that grade.
# 
# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for negative
# values or values greater than 100.

def get_grade(*grades)
  avg = grades.reduce(0){|sum,grade| sum + grade} / grades.length
  
  if avg >= 90
    "A"
  elsif avg >= 80 && avg < 90
    "B"
  elsif avg >= 70 && avg < 80
    "C"
  elsif avg >= 60 && avg < 70
    "D"
  elsif avg < 60
    "F"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Question 10
puts "\nQuestion 10"
# Grocery List
# Write a method which takes a grocery list (array) of fruits with quantities 
# and converts it into an array of the correct number of each fruit.

def buy_fruit(arr)
  arr.map {|fruit| [fruit[0]] * fruit[1] }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]