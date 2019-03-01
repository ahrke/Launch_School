# Question 1
# Write a method that takes two arguments, a string and a positive integer, and 
# prints the string as many times as the integer indicates.

def q1_print_times(str, num)
  num.times {|num_here|
    p str
  }
end

q1_print_times("hello world!",5)

# Question 2
# Write a method that takes one integer argument, which may be positive,
# negative, or zero. This method returns true if the number's absolute value is 
# odd. You may assume that the argument is a valid integer value.

def is_odd?(num)
  num.odd?
end

puts is_odd?(-5)
puts is_odd?(2)
puts is_odd?(0)

# Question 3
# Write a method that takes one argument, a positive integer, and returns a 
# list of the digits in the number.

def list_of_nums(num)
  num.to_s.split('').map! {|n| n.to_i}
end

puts list_of_nums(123456) == [1,2,3,4,5,6]
puts list_of_nums(375290) == [3, 7, 5, 2, 9, 0] # => true
puts list_of_nums(444) == [4, 4, 4]   

# Question 4
# Write a method that counts the number of occurrences of each element in
# a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurences(arry)
  arry.sort!
  iterator = 0
  loop do
    ele = arry[iterator]
    num_of_ele = arry.count(ele)
    puts "#{ele} => #{num_of_ele}"
    iterator += num_of_ele
    break if iterator >= arry.size
  end
end

count_occurences(vehicles)

# the better way to do this is to take advantage of hash

def count_occurences_w_hash(arry)
  occurrences = {}
  
  arry.each {|ele|
    occurrences[ele] = arry.count(ele)
  }
  
  occurrences.each {|k,v|
    puts "#{k.to_s} => #{v}"
  }
end

count_occurences_w_hash(vehicles)

# Question 5...actually 6 because my solution ended up being what 6 asks for
# Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.

def q5_reverse(str)
  str.split('').reverse.join('')
end

puts q5_reverse("What a wonderful world!")

# Question 7
# Write a method that takes one argument, a positive integer, and returns a 
# string of alternating 1s and 0s, always starting with 1. The length of the 
# string should match the given integer.

def q7_1_and_0(num)
  str_out = ''
  num.times {|num_here|
    num_here.even? ? str_out += '1' : str_out += '0'
  }
  str_out
end

puts q7_1_and_0(8)
puts q7_1_and_0(3)

# Question 8
# Write a method that takes one argument, an array containing integers, and 
# returns the average of all numbers in the array. The array will never be 
# empty and the numbers will always be positive integers.

def average(arry)
  sum = 0
  size = arry.size
  
  for num in arry 
    sum += num
  end
  
  sum / size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# I like this solution though
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

# Question 9
# Write a method that takes one argument, a positive integer, and returns the 
# sum of its digits.

def sum_of_num(num)
  arry = num.to_s.split('').map {|num| num.to_i}
  arry.reduce {|sum, num| sum + num}
end

puts sum_of_num(398)
puts sum_of_num(17)

# though...this following solution is much more beautiful
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

# Question 10
# Write a method that takes two arguments, a positive integer and a boolean, 
# and calculates the bonus for a given salary. If the boolean is true, the bonus
# should be half of the salary. If the boolean is false, the bonus should be 0.

def gross_salary(salary, bonus)
  bonus == true ? (salary += (salary*0.5)).to_i : salary.to_i
end

# actually...that is the solution to a different problem

def calculate_bonus(salary, bonus)
  bonus == true ? salary * 0.5 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000