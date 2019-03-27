require 'pry'

# Question 1
puts "\nQuestion 1"
# Longest Sentence
# Write a program that reads the content of a text file and then prints the longest 
# sentence in the file based on number of words. Sentences may end with periods (.), 
# exclamation points (!), or question marks (?). Any sequence of characters that are
# not spaces or sentence-ending characters should be treated as a word. You should 
# also print the number of words in the longest sentence.
# 
# Example text:

text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

def longest_sentence(str)
  sentences = str.gsub(/[\n]/,' ').split(/[.?!]/)
  longest = sentences.sort {|a,b| a.length <=> b.length }[-1]
  
  puts longest + " [#{longest.split(' ').length}]"
end

longest_sentence(text)

# Question 2
puts "\nQuestion 2"
# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this list:
# 
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that 
# do not use both letters from any given block. Each block can only be used once.
# 
# Write a method that returns true if the word passed in as an argument can be 
# spelled from this set of blocks, false otherwise.

def block_word?(str)
  blocks = {
    'B'=>'O',   'X'=>'K',   'D'=>'Q',   'C'=>'P',   'N'=>'A', 'G'=>'T',   'R'=>'E',   'F'=>'S',   'J'=>'W',   'H'=>'U', 'V'=>'I',   'L'=>'Y',   'Z'=>'M',
  }
  str.split('').each {|c|
    if blocks.keys.include?(c.upcase)
      if str.include?(blocks[c.upcase])
        return false
      end
    end
  }
  return true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# Question 3
puts "\nQuestion 3"
# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number 
# of uppercase and lowercase characters, as well as characters that were neither 
# of those two. Now we want to go one step further.
# 
# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are 
# lowercase letters, one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.
# 
# You may assume that the string will always contain at least one character.

def letter_percentages(str)
  upper = str.count('A-Z').to_f / str.length * 100
  lower = str.count('a-z').to_f / str.length * 100
  other = str.count('^a-zA-Z').to_f / str.length * 100
  
  { :lowercase => lower, :uppercase => upper, :neither => other }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Question 4
puts "\nQuestion 4"
# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be properly 
# balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(str)
  return false if (str.count('(') != str.count(')'))
  
  str1 = str.delete('^()')
  str1.count('(').times{|_| str1 = str1.gsub('()','') }
  
  str1 == '' ?
    true
    : false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# Question 5
puts "\nQuestion 5"
# Triangle Sides
# A triangle is classified as follows:
# 
# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must 
# be greater than the length of the longest side, and all sides must have lengths 
# greater than 0: if either of these conditions is not satisfied, the triangle is 
# invalid.
# 
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending 
# on whether the triangle is equilateral, isosceles, scalene, or invalid.

def triangle(n1,n2,n3)
  sorted_sides = [n1,n2,n3].sort
  return :invalid if n1 == 0 || n2 == 0 || n3 == 0
  return :invalid if (sorted_sides[0] + sorted_sides[1]) <= sorted_sides[2]
  
  return :equilateral if n1 == n2 && n2 == n3
  return :isosceles if n1 == n2 || n2 == n3 || n1 == n3
  return :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

#Question 6
puts "\nQuestion 6"
# Tri-Angles
# A triangle is classified as follows:
# 
# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
# all angles must be greater than 0: if either of these conditions is not satisfied,
# the triangle is invalid.
# 
# Write a method that takes the 3 angles of a triangle as arguments, and returns a 
# symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is 
# a right, acute, obtuse, or invalid triangle.
# 
# You may assume integer valued angles so you don't have to worry about floating 
# point errors. You may also assume that the arguments are specified in degrees.

def triangle(s1,s2,s3)
  sides = [s1,s2,s3]
  return :invalid if sides.reduce(:+) != 180 || sides.include?(0)
  return :right if sides.include?(90)
  return :acute if sides.all? {|s| s < 90 }
  return :obtuse 
  
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# Question 7
puts "\nQuestion 7"
# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given by
# an argument. You may assume that the year is greater than 1752 (when the United 
# Kingdom adopted the modern Gregorian Calendar) and that it will remain in use
# for the foreseeable future.

def friday_13th(year)
  # get 13th day of every month, count how many fall on a friday
  12.times.select {|month|
    Time.new(year,month + 1,13).friday?
  }.length
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Question 8
puts "\nQuestion 8"
# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that is
# a multiple of 7, and whose digits occur exactly once each. So, for example, 49 
# is a featured number, but 98 is not (it is not odd), 97 is not (it is not a 
# multiple of 7), and 133 is not (the digit 3 appears twice).
# 
# Write a method that takes a single integer as an argument, and returns the next
# featured number that is greater than the argument. Issue an error message if 
# there is no next featured number.
def mutliple_of_7?(num)
  num % 7 == 0  
end

def no_multiple_digits?(num)
  str_num = num.to_s
  n_of_multiple = 0
  str_num.split('').each {|n|
    if str_num.count(n) > 1
      n_of_multiple += 1
    end
  }
  n_of_multiple == 0
end

def featured_num?(num)
  num.odd? && no_multiple_digits?(num) && mutliple_of_7?(num)
end

def featured(num)
  multiplier_num = (num / 7) + 1
  featured_num = 0
  
  loop {
    featured_num = multiplier_num * 7
    multiplier_num += 1
    
    # binding.pry
    break if featured_num?(featured_num)
  }
  
  featured_num
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Question 9
puts "\nQuestion 9"
# Bubble Sort
# Bubble Sort is one of the simplest sorting algorithms available. It isn't an
# efficient algorithm, but it's a great exercise for student developers. In this 
# exercise, you will write a method that does a bubble sort of an Array.
# 
# A bubble sort works by making multiple passes (iterations) through the Array. 
# On each pass, each pair of consecutive elements is compared. If the first of 
# the two elements is greater than the second, then the two elements are swapped. 
# This process is repeated until a complete pass is made without performing any 
# swaps; at that point, the Array is completely sorted.
# 
# 6	2	7	1	4	Start: compare 6 > 2? Yes
# 2	6	7	1	4	Exchange
# 2	6	7	1	4	6 > 7? No (no exchange)
# 2	6	7	1	4	7 > 1? Yes
# 2	6	1	7	4	Exchange
# 2	6	1	7	4	7 > 4? Yes
# 2	6	1	4	7	Exchange
# 2	6	1	4	7	2 > 6? No
# 2	6	1	4	7	6 > 1? Yes
# 2	1	6	4	7	Exchange
# 2	1	6	4	7	6 > 4? Yes
# 2	1	4	6	7	Exchange
# 2	1	4	6	7	6 > 7? No
# 2	1	4	6	7	2 > 1? Yes
# 1	2	4	6	7	Exchange
# 1	2	4	6	7	2 > 4? No
# 1	2	4	6	7	4 > 6? No
# 1	2	4	6	7	6 > 7? No
# 1	2	4	6	7	1 > 2? No
# 1	2	4	6	7	2 > 4? No
# 1	2	4	6	7	4 > 6? No
# 1	2	4	6	7	6 > 7? No
# 1	2	4	6	7	No swaps; all done; sorted
# We can stop iterating the first time we make a pass through the array without
# making any swaps; at that point, the entire Array is sorted.
# 
# For further information, including pseudo-code that demonstrates the algorithm 
# as well as a minor optimization technique, see the Bubble Sort wikipedia page.
# 
# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array passed as an argument. You 
# may assume that the Array contains at least 2 elements.

def bubble_sort!(arr)
  loop {
    swap_count = 0
    
    (arr.length-1).times {|n|
      if arr[n] > arr[n+1] 
        arr[n],arr[n+1] = arr[n+1],arr[n]
        swap_count += 1
      end
    }
    
    break if swap_count == 0
  }
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Question 10
puts "\nQuestion 10"
# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n positive 
# integers.

def square_of_sum_of(num)
  (num+1).times.reduce(:+) ** 2
end

def square_of_each_of(num)
  (num+1).times.reduce(0) {|s,n| s += n**2}
end

def sum_square_difference(num)
  (square_of_each_of(num) - square_of_sum_of(num)).abs
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150