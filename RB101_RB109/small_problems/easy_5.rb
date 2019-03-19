# Question 1
# ASCII String Value
# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the 
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

def ascii_value(str)
  str.split('').reduce(0) {|sum,chr| sum + chr.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Question 2
# After Midnight (Part 1)
# The time of day can be represented as the number of minutes before or after 
# midnight. If the number of minutes is positive, the time is after midnight. If 
# the number of minutes is negative, the time is before midnight.
# 
# Write a method that takes a time using this minute-based format and returns the 
# time of day in 24 hour format (hh:mm). Your method should work with any integer 
# input.
# 
# You may not use ruby's Date and Time classes.

def time_of_day(time)
  hour = (time % (24 * 60)) / 60
  minute = time % 60
  
  format('%02d:%02d',hour,minute)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Question 3
# After Midnight (Part 2)
# As seen in the previous exercise, the time of day can be represented as the 
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative, the
# time is before midnight.
# 
# Write two methods that each take a time of day in 24 hour format, and return 
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.
# 
# You may not use ruby's Date and Time methods.

def after_midnight(time)
  hour,minute = time.split(':').map(&:to_i)
  
  return hour == 24 ?
    0
    : ((hour * 60) + minute)
end

def before_midnight(time)
  hour,minute = time.split(':')
  
  return hour.to_i == 0 ?
    0
    : 1440 - ((hour.to_i * 60) + minute.to_i)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00')

# Question 4
# Letter Swap
# Given a string of words separated by spaces, write a method that takes this 
# string of words and returns a string in which the first and last letters of
# every word are swapped.
# 
# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

def swap(str)
  swapped_str = str.split(' ').map {|word|
    tmp = word[-1]
    word[-1] = word[0]
    word[0] = tmp
    
    word
  }
  
  swapped_str.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Question 5
# Clean up the words
# Given a string that consists of some words and an assortment of non-alphabetic 
# characters, write a method that returns that string with all of the
# non-alphabetic characters replaced by spaces. If one or more non-alphabetic 
# characters occur in a row, you should only have one space in the result (the 
# result should never have consecutive spaces).

def cleanup(str)
  str.gsub(/\W+/,' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '

# Question 6
# Letter Counter (Part 1)
# Write a method that takes a string with one or more space separated words and 
# returns a hash that shows the number of words of different sizes.
# 
# Words consist of any string of characters that do not include a space.

def word_sizes(str)
  arr = str.split(' ')
  hsh = Hash.new(0)
  
  arr.each {|word|
    hsh[word.length] += 1
  }
  
  hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Question 7
# Letter Counter (Part 2)
# Modify the word_sizes method from the previous exercise to exclude non-letters 
# when determining word size. For instance, the length of "it's" is 3, not 4.

def word_sizes(str)
  arr = str.split(' ')
  hsh = Hash.new(0)
  
  arr.each {|word|
    hsh[word.delete('^A-Za-z').length] += 1
  }
  
  hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# Question 8
# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19, and returns an
# Array of those Integers sorted based on the English words for each number:
# 
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
# thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen


def alphabetic_number_sort(arr)
  number_words = %w(zero one two three four five six seven eight nine ten eleven
  twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  
  new_hsh = {}
  arr.sort {|a,b|
    number_words[a] <=> number_words[b]
  }
end

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# Question 9
# ddaaiillyy ddoouubbllee
# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use String#squeeze 
# or String#squeeze!.

def crunch(str)
  if str == '' 
    return ''
  end
  
  new_arr = str.split('')
  str_out = new_arr[0]
  
  (1..new_arr.size-1).each {|n|
    new_arr[n] != new_arr[n-1] ? 
      str_out << new_arr[n]
      : n
  }
  
  str_out
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Question 10
# Bannerizer
# Write a method that will take a short line of text, and print it within a box.

def print_in_box(str)
  width = str.length + 2
  
  puts "+#{'-'*width}+"
  puts "|#{' '*width}|"
  puts "| #{str} |"
  puts "|#{' '*width}|"
  puts "+#{'-'*width}+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

# Question 11
# Spin Me Around In Circles
# You are given a method named spin_me that takes a string as an argument and 
# returns a string that contains the same words, but with each word's characters
# reversed. Given the method's implementation, will the returned string be the 
# same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# it will return the same array, however the elements in the array are pointing
# to different objects

# Wrong. It is a different object. Once we call split on the string, it became
# a different object, seeing as it's an array. Using split then join does not
# keep it the same object, it is a different object being returned