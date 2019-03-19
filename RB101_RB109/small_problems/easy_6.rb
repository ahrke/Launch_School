# Question 1
# Cute angles
# Write a method that takes a floating point number that represents an angle 
# between 0 and 360 degrees and returns a String that represents that angle in 
# degrees, minutes and seconds. You should use a degree symbol (°) to represent 
# degrees, a single quote (') to represent minutes, and a double quote (") to 
# represent seconds. A degree has 60 minutes, while a minute has 60 seconds.


def dms(dd)
  degree = "\xC2\xB0"
  total_seconds = (dd*3600).round
  d,remaining_seconds = total_seconds.divmod(3600)
  m,s = remaining_seconds.divmod(60)

  format('%d%c%02d\'%02d"',d,degree,m,s)
end

p dms(30)
p dms(76.73)
p dms(254.6) 
p dms(93.034773)
p dms(0) 
p dms(360) 

# Question 2
# Delete vowels
# Write a method that takes an array of strings, and returns an array of the 
# same string values, except with the vowels (a, e, i, o, u) removed.

def remove_vowels(str_arr)
  str_arr.map {|str|
    str.gsub(/[aeiouAEIOU]+/,'')
  }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Question 3
# Fibonacci Number Location By Length
# Give us your feedback
# Fibonacci Number Location By Length
# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) 
# such that the first 2 numbers are 1 by definition, and each subsequent number 
# is the sum of the two previous numbers. This series appears throughout the 
# natural world.
# 
# Computationally, the Fibonacci series is a very simple series, but the results
# grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
# 354,224,848,179,261,915,075 -- that's enormous, especially considering that
# it takes 6 iterations before it generates the first 2 digit number.
# 
# Write a method that calculates and returns the index of the first Fibonacci 
# number that has the number of digits specified as an argument. (The first 
# Fibonacci number has index 1.)

def find_fibonacci_index_by_length(index)
  fib_1 = 0
  fib_2 = 1
  power = 10**(index-1)
  count = 0
  loop {
    tmp = fib_2
    fib_2 += fib_1
    fib_1 = tmp
    count += 1
    break if fib_2 / power >= 1
  }
  
  count + 1
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# Question 4
# Reversed Arrays (Part 1)
# Write a method that takes an Array as an argument, and reverses its elements in 
# place; that is, mutate the Array passed into this method. The return value 
# should be the same Array object.
# 
# You may not use Array#reverse or Array#reverse!.

def q4_reverse!(arr)
  tmp_arr = []
  length = arr.length - 1
  (arr.length).times {|num|
    tmp_arr[num] = arr[length-num]
  }
  
  arr.length.times {|num|
    arr[num] = tmp_arr[num]
  }
  
  arr
end

p list = [1,2,3,4]
p result = q4_reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
q4_reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
q4_reverse!(list) == ["abc"]
list == ["abc"]

list = []
q4_reverse!(list) == []
list == []

# The better (and cooler) way to do this
# def reverse!(array)
#   left_index = 0
#   right_index = -1
# 
#   while left_index < array.size / 2
#     array[left_index], array[right_index] = array[right_index], array[left_index]
#     left_index += 1
#     right_index -= 1
#   end
# 
#   array
# end


# Question 5
# Reversed Arrays (Part 2)
# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.
# 
# You may not use Array#reverse or Array#reverse!, nor may you use the method you
# wrote in the previous exercise.

def q5_reverse(arr)
  tmp_arr = []
  length = arr.length - 1
  (arr.length).times {|num|
    tmp_arr[num] = arr[length-num]
  }
  
  tmp_arr
end

p q5_reverse([1,2,3,4]) == [4,3,2,1]          # => true
p q5_reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p q5_reverse(['abc']) == ['abc']              # => true
p q5_reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = q5_reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# Question 6
# Combining Arrays
# Write a method that takes two Arrays as arguments, and returns an Array that 
# contains all of the values from the argument Arrays. There should be no 
# duplication of values in the returned Array, even if there are duplicates in 
# the original Arrays.

def q6_merge(arr1, arr2)
  new_arr = [].concat(arr1).concat(arr2).uniq
end

p q6_merge([1, 3, 5], [3, 6, 9])
p q6_merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# can use Array#| like so... arr1 | arr2 # [1,3,5,6,9]

# Question 7
# Halvsies
# Write a method that takes an Array as an argument, and returns two Arrays 
# (as a pair of nested Arrays) that contain the first half and second half of the 
# original Array, respectively. If the original array contains an odd number of 
# elements, the middle element should be placed in the first half Array.

def halvsies(arr)
  arr1 = []
  arr2 = []
  length = arr.length
  arr.each_with_index {|e,n|
    length.even? ?
      n >= (length/2) ?
        arr2 << e
        : arr1 << e
      : n > (length/2) ?
        arr2 << e
        : arr1 << e
  }
  
  [arr1,arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# cleaner version
# def halvsies(array)
#   first_half = array.slice(0, (array.size / 2.0).ceil)
#   second_half = array.slice(first_half.size, array.size - first_half.size)
#   [first_half, second_half]
# end


# Question 8
# Find the Duplicate
# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and return 
# the duplicate value that is known to be in the array.

def find_dup(arr)
  arr.sort {|a,b|
    if a == b
      return a
    end
    a <=> b
  }
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
          
# cleaner. using Array#find
# def find_dup(array)
#   array.find { |element| array.count(element) == 2 }
# end


# Question 9
# Does My List Include This?
# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your solution.

def include?(arr,item)
  included = false
  arr.each {|ele|
    ele == item ?
      included = true
      : nil
  }
  included
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Question 10
# Right Triangles
# Write a method that takes a positive integer, n, as an argument, and displays a
# right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left of
# the triangle, and the other end at the upper-right.

def triangle(num)
  (num + 1).times {|n|
    puts "#{' ' * (num - n)}#{'*' * n}"
  }
end

triangle(5)
triangle(9)