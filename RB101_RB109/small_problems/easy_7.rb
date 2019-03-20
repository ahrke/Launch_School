# Question 1
# Combine Two Lists
# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.
# 
# You may assume that both input Arrays are non-empty, and that they have the same
# number of elements.

def interleave(arr1, arr2)
  arr = []
  arr1.length.times {|n| 
    arr << arr1[n]
    arr << arr2[n]
  }
  arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Question 2
# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters, 
# and one the number of characters that are neither.

def letter_case_count(str)
  hsh = {}
  hsh[:lowercase] = str.scan(/[a-z]+/).join('').length
  hsh[:uppercase] = str.scan(/[A-Z]+/).join('').length
  hsh[:neither] = str.scan(/[\d\W]+/).join('').length
  
  hsh
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Question 3
# Capitalize Words
# Write a method that takes a single String argument and returns a new string 
# that contains the original value of the argument with the first character of 
# every word capitalized and all other letters lowercase.
# 
# You may assume that words are any sequence of non-blank characters.

def word_cap(str)
  str.split(' ').map {|word| word.downcase.capitalize! || word }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Question 4
# Swap Case
# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be unchanged.
# 
# You may not use String#swapcase; write your own version of this method.

def swapcase(str)
  new_str = ''
  str.length.times {|n|
    str[n].match(/[a-z]/) ?
      new_str << str[n].upcase
      : str[n].match(/[A-Z]/) ?
          new_str << str[n].downcase
          : new_str << str[n]
  }
  new_str
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Question 5
# Staggered Caps (Part 1)
# Write a method that takes a String as an argument, and returns a new String 
# that contains the original value using a staggered capitalization scheme in 
# which every other character is capitalized, and the remaining characters are 
# lowercase. Characters that are not letters should not be changed, but count as 
# characters when switching between upper and lowercase.

def staggered_case(str)
  new_str = ''
  str.length.times {|c|
    c.odd? ?
      new_str << str[c].downcase
      : new_str << str[c].upcase
  }
  new_str
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Question 6
# Staggered Caps (Part 2)
# Modify the method from the previous exercise so it ignores non-alphabetic 
# characters when determining whether it should uppercase or lowercase each 
# letter. The non-alphabetic characters should still be included in the return 
# value; they just don't count when toggling the desired case.

def staggered_case(str)
  new_str = ''
  need_cap = true
  str.length.times {|c|
    if str[c].match(/[a-zA-Z]/) 
      if need_cap 
        new_str << str[c].upcase
      else
        new_str << str[c].downcase
      end
      need_cap = !need_cap
    else
      new_str << str[c]
    end
  }
  new_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Question 7
# Multiplicative Average
# Write a method that takes an Array of integers as input, multiplies all the 
# numbers together, divides the result by the number of entries in the Array, and 
# then prints the result rounded to 3 decimal places. Assume the array is non-empty.

def show_multiplicative_average(arr)
  format('%0.3f',arr.reduce(&:*) / arr.length.to_f)
end

p show_multiplicative_average([3, 5])
# The result is 7.500

p show_multiplicative_average([6])
# The result is 6.000

p show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

# Question 8
# Multiply Lists
# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each pair
# of numbers from the arguments that have the same index. You may assume that the
# arguments contain the same number of elements.

def multiply_list(arr1, arr2)
  arr = []
  arr1.each_with_index {|i,n| arr << i * arr2[n] }
  arr
end

def multiply_list(arr1,arr2)
  arr1.zip(arr2).map {|sub_arr| sub_arr[0] * sub_arr[1] }
end

p multiply_list([3, 5, 7], [9, 10, 11])
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Question 9
# Multiply All Pairs
# Write a method that takes two Array arguments in which each Array contains a 
# list of numbers, and returns a new Array that contains the product of every pair
# of numbers that can be formed between the elements of the two Arrays. The 
# results should be sorted by increasing value.
# 
# You may assume that neither argument is an empty Array.

def multiply_all_pairs(arr1, arr2)
  product_arr = []
  arr1.each {|n1|
    arr2.each {|n2|
      product_arr << n1 * n2
    }
  }
  product_arr.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Question 10
# The End Is Near But Not Here
# Write a method that returns the next to last word in the String passed to it as 
# an argument.
# 
# Words are any sequence of non-blank characters.
# 
# You may assume that the input String will always contain at least two words.

def penultimate(str)
  str.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'