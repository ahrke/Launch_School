require 'pry'

# Question 1
puts "\nQuestion 1"
# Madlibs Revisited
# Let's build another program using madlibs. We made a program like this in the 
# easy exercises. This time, the requirements are a bit different.
# 
# Make a madlibs program that reads in some text from a text file that you have 
# created, and then plugs in a selection of randomized nouns, verbs, adjectives, 
# and adverbs into that text and prints it. You can build your lists of nouns, 
# verbs, adjectives, and adverbs directly into your program, but the text data 
# should come from a file or other external source. Your program should read this
# text, and for each line, it should place random words of the appropriate types 
# into the text, and print the result.
# 
# The challenge of this program isn't about writing your program; it's about 
# choosing how to represent your data. Choose the right way to structure your 
# data, and this problem becomes a whole lot easier. This is why we don't show you
# what the input data looks like; the input representation is your responsibility.

def madlibs(txt)
  nouns = %w(cat dog girl boy grandpa plant wabbit hero imposter spy toaster tiger)
  verbs = %w(licks runs disappears jumps leaps crawls falls dances wiggles stampedes sings)
  adjectives = %w(blue purple slow lethargic lazy hungry silly fun)
  adverbs = %w(excitedly calmly exhaustingly happily knowingly above below noisily)
  
  File.open(txt) {|file|
    file.each {|line|
      puts format(line, noun:      nouns.sample,
                        adjective: adjectives.sample,
                        adverb:    adverbs.sample,
                        verb:      verbs.sample)
    }
  }
end

p madlibs("madlibs.txt")

# Question 2
puts "\nQuestion 2"
# Seeing Stars
# Write a method that displays an 8-pointed star in an nxn grid, where n is an 
# odd integer that is supplied as an argument to the method. The smallest such
# star you need to handle is a 7x7 grid.

def star_row(row,star)
  star_row_str = "#{' ' * star}"
  middle = star / 2
  first, last = row, (star - 1 - row)
  
  star_row_str[first] = '*'
  star_row_str[last] = '*'
  star_row_str[middle] = '*'
  star_row_str
end

def star(num)
  (num).times {|n|
    puts n == (num/2) ?
      '*' * num
      : star_row(n,num)
  }
  
end

star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

# Question 3
puts "\nQuestion 3"
# Transpose 3x3
# A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array 
# and all of the sub-Arrays has 3 elements. For example:
# 
# 1  5  8
# 4  7  2
# 3  9  6
# can be described by the Array of Arrays:
# 
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# The transpose of a 3 x 3 matrix is the matrix that results from exchanging the
# columns and rows of the original matrix. For example, the transposition of the 
# array shown above is:
# 
# 1  4  3
# 5  7  9
# 8  2  6
# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns 
# the transpose of the original matrix. Note that there is a Array#transpose 
# method that does this -- you may not use it for this exercise. You also are not 
# allowed to use the Matrix class from the standard library. Your task is to do 
#   this yourself.
# 
# Take care not to modify the original matrix: you must produce a new matrix and 
# leave the original matrix unchanged.

def transpose(matrix)
  # created an array with values from first row, then for each element, concat
  # it's associated column values
  new_matrix = matrix[0].map {|e| [e] }
  
  # row => new_matrix_row
  # col => new_matrix_column
  matrix[0].length.times {|row|
    1.upto(matrix.length-1) {|col|
      new_matrix[row] << matrix[col][row]
    }
  }
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Question 4
puts "\nQuestion 4"
# Transpose MxN
# In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as 
# represented by a ruby Array of Arrays.
# 
# Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices.
# Any matrix can be transposed by simply switching columns with rows.
# 
# Modify your transpose method from the previous exercise so it works with any 
# matrix with at least 1 row and 1 column.

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# used transpose method from earlier as it was already implemented for any number of matrices

# Question 5
puts "\nQuestion 5"
# Rotating Matrices
# As we saw in the previous exercises, a matrix can be represented in ruby by an
# Array of Arrays. For example:
# 
# 1  5  8
# 4  7  2
# 3  9  6
# can be described by the Array of Arrays:
# 
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# A 90-degree rotation of a matrix produces a new matrix in which each side of the 
# matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of
# the matrix shown above is:
# 
# 3  4  1
# 9  7  5
# 6  2  8
# A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:
# 
# 3  4  1
# 9  7  5
# is:
# 
# 9  3
# 7  4
# 5  1
# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise 
# as shown above.
# 
# Examples

def rotate90(matrix)
  new_matrix = []
  
  # determine number of columns, that is new number of rows, and vice versa
  0.upto(matrix[0].length - 1) {|row|
    new_row = []
    (matrix.length - 1).downto(0) {|col|
      new_row << matrix[col][row]
    }
    new_matrix << new_row
  }
  new_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2


# Question 6
puts "\nQuestion 6"
# Fix the Bug
# The following code:

def my_method(array)
  if array.empty?
    []
  elsif array.length > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
# is expected to print:

# []
# [21]
# [9, 16]
# [25, 36, 49]

# Question 7
puts "\nQuestion 7"
# Merge Sorted Lists
# Write a method that takes two sorted Arrays as arguments, and returns a new 
# Array that contains all elements from both arguments in sorted order.
# 
# You may not provide any solution that requires you to sort the result array. 
# You must build the result array one element at a time in the proper order.
# 
# Your solution should not mutate the input arrays.

def merge(arr1, arr2)
  if arr1 == []
    return arr2
  elsif arr2 == []
    return arr1
  end
  
  result = []
  arr2_pos = 0
  
  arr1.each_index {|n|
    loop {
      #binding.pry
      if arr2_pos == (arr2.length) || arr1[n] < arr2[arr2_pos]
        result << arr1[n]
        break
      else
        result << arr2[arr2_pos]
        arr2_pos += 1
      end
    }
  }
  
  if arr2_pos != (arr2.length)
    arr2_pos.upto(arr2.length) {|n|
      result << arr2[n]
    }
  end
  
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# Question 8
puts "\nQuestion 8"
# Merge Sort
# Sort an array of passed in values using merge sort. You can assume that this 
# array may contain only one type of data. And that data may be either all 
# numbers or all strings.
# 
# Merge sort is a recursive sorting algorithm that works by breaking down the
# array elements into nested sub-arrays, then recombining those nested sub-arrays
# in sorted order. It is best shown by example. For instance, let's merge sort
# the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]
# We then work our way back to a flat array by merging each pair of nested sub-arrays:
# 
# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

def create_sub(arr)
  return arr if arr.length == 1
  result = [arr[0..(arr.length/2)-1],arr[(arr.length/2)..-1]]
  
  [create_sub(result[0]),create_sub(result[1])]
end

def merge_sub(arr)
  return arr if arr.length == 1
  return merge(arr[0],merge_sub(arr[1])) if arr[0].length < arr[1].length
  
  merge(merge_sub(arr[0]), merge_sub(arr[1])).compact
end

def merge_sort(arr)
  sub_arrs = create_sub(arr)
  merge_sub(sub_arrs)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# alternatively
# def merge_sort(array)
#   return array if array.size == 1
# 
#   sub_array_1 = array[0...array.size / 2]
#   sub_array_2 = array[array.size / 2...array.size]
# 
#   sub_array_1 = merge_sort(sub_array_1)
#   sub_array_2 = merge_sort(sub_array_2)
# 
#   merge(sub_array_1, sub_array_2)
# end

# Question 9
puts "\nQuestion 9"
# Egyptian Fractions
# A Rational Number is any number that can be represented as the result of the
# division between two integers, e.g., 1/3, 3/2, 22/7, etc. The number to the
# left is called the numerator, and the number to the right is called the denominator.
# 
# A Unit Fraction is a rational number where the numerator is 1.
# 
# An Egyptian Fraction is the sum of a series of distinct unit fractions (no two 
# are the same), such as:
# 
# 1   1    1    1
# - + - + -- + --
# 2   3   13   15
# Every positive rational number can be written as an Egyptian fraction. For example:
# 
#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6
# Write two methods: one that takes a Rational number as an argument, and returns 
# an Array of the denominators that are part of an Egyptian Fraction representation 
# of the number, and another that takes an Array of numbers in the same format, and
# calculates the resulting Rational number. You will need to use the Rational class
# provided by Ruby.

def egyptian(rational)
  return [1] if rational == Rational(1,1)
  rat = rational
  denominator = 1
  e_fracs = []
  
  loop {
    #binding.pry
    if Rational(1,denominator) < rat
      e_fracs << denominator
      rat -= Rational(1,denominator)
      denominator += 1
    elsif Rational(1,denominator) == rat
      e_fracs << denominator
      break
    else
      denominator += 1
    end
  }
  e_fracs
end

def unegyptian(rational)
  e_frac = rational.reduce(0) {|s,den|
    s += Rational(1,den)
  }
  
  e_frac
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
