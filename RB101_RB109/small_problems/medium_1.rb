require 'pry'

# Question 1
puts "Question 1"
# Rotation (Part 1)
# Write a method that rotates an array by moving the first element to the end 
# of the array. The original array should not be modified.
# 
# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
  [arr[1..-1],arr[0]].flatten
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Question 2
puts "\nQuestion 2"
# Rotation (Part 2)
# Write a method that can rotate the last n digits of a number. For example:

def rotate_rightmost_digits(num, n)
  [num.to_s[0..-(n+1)],rotate_array(num.to_s[-n..-1])].flatten.join('').to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
# Note that rotating just 1 digit results in the original number being returned.
# 
# You may use the rotate_array method from the previous exercise if you want.
# 
# You may assume that n is always a positive integer.

# Question 3
puts "\nQuestion 3"
# Rotation (Part 3)
# If you take a number like 735291, and rotate it to the left, you get 352917. 
# If you now keep the first digit fixed in place, and rotate the remaining digits, 
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 
# 321759. Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits 
# to get 321579. The resulting number is called the maximum rotation of the 
# original number.
# 
# Write a method that takes an integer as argument, and returns the maximum 
# rotation of that argument. You can (and probably should) use the 
# rotate_rightmost_digits method from the previous exercise.
# 
# Note that you do not have to handle multiple 0s.

def max_rotation(num)
  num_out = num
  num.to_s.length.downto(1) {|n|
    num_out = rotate_rightmost_digits(num_out, n)
  }
  num_out.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Question 4
puts "\nQuestion 4"
# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch is 
# connected to exactly one light that is initially off. You walk down the row 
# of switches and toggle every one of them. You go back to the beginning, and on
# this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, 
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. You
# repeat this process and keep going until you have been through n repetitions.
# 
# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:
# 
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
# 
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

def switch(it)
  it == true ? false : true
end

def light_switch(num)
  switches = {}
  1.upto(num) {|n|
    switches[n] = false
  }
  
  1.upto(num + 1) {|num|
    switches.keys.each {|i|
      if i % (num) == 0
        switches[i] = switch(switches[i])
      end
    }
  }
  
  switches.map {|k,v|
    v == true ?
      k
      : next
  }.compact
end

p light_switch(5)
p light_switch(10)

# Question 5
puts "\nQuestion 5"
# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is 
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.

def diamond(num)
  puts "this is a #{num} diamond!\n\n"
  star_count = 1
  half_point = (num.to_f/2).floor
  0.upto(num-1) {|n|
    if n < half_point 
      puts "#{' ' * (half_point - n)}#{'*' * star_count}"
      star_count += 2
    elsif n == half_point
      puts "#{'*' * star_count}"
      star_count -= 2
    elsif n > half_point
      puts "#{' ' * (n - half_point)}#{'*' * star_count}"
      star_count -= 2
    end
  }
  
  " "
end

puts diamond(1)
puts diamond(3)
puts diamond(9)

# Question 6
puts "\nQuestion 6"
# Stack Machine Interpretation
# A stack is a list of values that grows and shrinks dynamically. In ruby, a 
# stack is easily implemented as an Array that just uses the #push and #pop methods.
# 
# A stack-and-register programming language is a language that uses a stack of 
# values. Each operation in the language operates on a register, which can be
# thought of as the current value. The register is not part of the stack. Operations 
# that require two values pop the topmost item from the stack (that is, the operation 
# removes the most recently pushed value from the stack), perform the operation using
# the popped value and the register value, and then store the result back in the register.
# 
# Consider a MULT operation in a stack-and-register language. It multiplies the 
# stack value with the register value, removes the value from the stack, and then 
# stores the result back in the register. Thus, if we start with a stack of 3 6 4 
# (where 4 is the topmost item in the stack), and a register value of 7, then the 
# MULT operation will transform things to 3 6 on the stack (the 4 is removed), and 
# the result of the multiplication, 28, is left in the register. If we do another 
# MULT at this point, then the stack is transformed to 3, and the register is left 
# with the value 168.
# 
# Write a method that implements a miniature stack-and-register-based programming 
# language that has the following commands:
# 
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the 
# result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, 
# storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, 
# storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, 
# storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, 
# storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).
# 
# Programs will be supplied to your language method via a string passed in as an
# argument. Your program may assume that all programs are correct programs; that 
# is, they won't do anything like try to pop a non-existent value from the stack, 
# and they won't contain unknown tokens.
# 
# You should initialize the register to 0.

def minilang(str)
  stack = []
  reg = 0
  
  commands = str.split(' ')
  
  commands.each {|command|
    case command
    when 'PRINT'
      puts reg
    when 'PUSH'
      stack.push(reg)
    when 'POP'
      reg = stack.pop
    when 'ADD'
      reg += stack.pop  
    when 'SUB'
      reg -= stack.pop  
    when 'MULT'
      reg *= stack.pop  
    when 'DIV'
      reg /= stack.pop  
    when 'MOD'
      reg %= stack.pop
    else
      reg = command.to_i
    end
  }
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Question 7
puts "\nQuestion 7"
# Word to Digit
# Write a method that takes a sentence string as input, and returns the same 
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

def word_to_digit(str)
  num_hash = {
    'one'=> 1, 'two'=> 2, 'three'=> 3, 'four'=> 4, 'five'=> 5, 'six'=> 6, 'seven'=> 7, 'eight'=> 8, 'nine'=> 9, 'zero'=> 0
  }
  
  num_hash.keys.each {|key|
    str.gsub!(key,num_hash[key].to_s)
  }
  
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Question 8
puts "\nQuestion 8"
# Fibonacci Numbers (Recursion)
# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each
# number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, 
# the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:
# 
# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
# Sequences like this translate naturally as "recursive" methods. A recursive 
# method is one in which the method calls itself. For example:
# 
# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end
# sum is a recursive method that computes the sum of all integers between 1 and n.
# 
# Recursive methods have three primary qualities:
# 
# They call themselves at least once.
# They have a condition that stops the recursion (n == 1 above).
# They use the result returned by themselves.
# In the code above, sum calls itself once; it uses a condition of n == 1 to stop
# recursing; and, n + sum(n - 1) uses the return value of the recursive call to 
# compute a new return value.
# 
# Write a recursive method that computes the nth Fibonacci number, where nth is 
# an argument to the method.

def fibonacci(n)
  return 1 if n <= 2
  
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# Question 9
puts "\nQuestion 9"
# Fibonacci Numbers (Procedural)
# In the previous exercise, we developed a recursive solution to calculating the
# nth Fibonacci number. In a language that is not optimized for recursion, some
# (not all) recursive methods can be extremely slow and require massive quantities
# of memory and/or stack space.
# 
# Ruby does a reasonably good job of handling recursion, but it isn't designed for
# heavy recursion; as a result, the Fibonacci solution is only useful up to about 
# fibonacci(40). With higher values of nth, the recursive solution is impractical.
# (Our tail recursive solution did much better, but even that failed at around 
# fibonacci(8200).)
# 
# Fortunately, every recursive method can be rewritten as a non-recursive 
# (procedural) method.
# 
# Rewrite your recursive fibonacci method so that it computes its results without 
# recursion.

def q9_fibonacci(num)
  f1 = 0
  f2 = 1
  (num-1).times {|_|
    tmp = f2
    f2 += f1 
    f1 = tmp
  }
  f2
end

p q9_fibonacci(20) == 6765
p q9_fibonacci(100) == 354224848179261915075
# p q9_fibonacci(100_001) # => 4202692702.....8285979669707537501

# Question 10
puts "\nQuestion 10"
# Fibonacci Numbers (Last Digit)
# In the previous exercise, we developed a procedural method for computing the 
# value of the nth Fibonacci numbers. This method was really fast, computing the
# 20899 digit 100,001st Fibonacci sequence almost instantly.
# 
# In this exercise, you are going to compute a method that returns the last digit
# of the nth Fibonacci number.

def fibonacci_last(n)
  fib = q9_fibonacci(n)
  
  fib.to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4