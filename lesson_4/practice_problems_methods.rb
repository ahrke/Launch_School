# Question 1
# What is the return value of the select method below? Why?

q1_arr = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

# this would return an array ['hi','hi','hi'] as 'hi' is the last line before
# the end of the block, which is what gets returned. 'hi' is a truthy value, so
# it will be added to the returning array

p q1_arr

# I was partly correct, and mainly incorrect. Since 'hi' is a truthy result, the
# value entered into the block (value of the current array element), #select
# will return that element. Resulting in [1,2,3] as the returned array

# ============================================
# Question 2
# How does count treat the block's return value? How can we find out?

q2_result = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# #count will return the number of elements in the calling object that meet
# the condition of having a word with less than 4 letters. In this case, it will
# return 2

p q2_result

# ============================================
# Question 3
# What is the return value of reject in the following code? Why?

q3_result = [1, 2, 3].reject do |num|
  puts num
end

# the return value would be [1,2,3] as each iteration would return nil, a falsey
# value. Since #reject will append elements who's block returns a falsey value
# we should get [1,2,3] back as puts always returns nil

p q3_result

# ============================================
# Question 4
# What is the return value of each_with_object in the following code? Why?

q4_result = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# the return value of this code group would be
# [["a","ant"],["b","bear"],["c","cat"]]
# each_with_object always returns an array, even if our accumulator is a hash

p q4_result

# wrong. I was confusing #ach_with_object with #partition. This method will 
# return a hash or array, depending on what we enter as our argument. 

# ============================================
# Question 5
# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# #shift 'pops' the first item from the collection. We can find out by either
# testing using irb, or referring to ruby docs

p hash

# ============================================
# Question 6
# What is the return value of the following statement? Why?

q6_result = ['ant', 'bear', 'caterpillar'].pop.size

# this line of code would return 2, as #size is called from ['ant','bear'], 
# which has a size of 2 (the third item was popped)

p q6_result

# incorrect, the result is 11. The reason is because Array#pop removes the last
# element, and returns that element, which means #size is working on a String
# ('caterpillar'), and returning the size of that String

# ============================================
# Question 7
# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

q7_result = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# the block's return value is based on whether the current element is an odd
# number or not. If ANY block returns a true, #any? will return true. 
# #any? here will return true, as 1 and 3 are odd numbers, which will result in
# their respective blocks being truthy
# it will output 1, as it is the first to meet the selection criteria

puts q7_result

# ============================================
# Question 8
# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# #take(n) takes the first n number of values in given array. So here, it would
# return [1,2]
# it is not a destructive method. We can find out by testing it

p arr

# from testing our arr array, we can see that it remains the same

# ============================================
# Question 9
# What is the return value of map in the following code? Why?

q9_result = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# the return value would be ['bear'], as #map returns an array of values
# who's blocks return a truthy value. Only 'bear' is a String that is longer
# than 3 characters

p q9_result

# wrong, the result will be [nil, 'bear'] as #map will return a new array with
# al lof the returned values from each block enumerated. The first value, 'ant', 
# is not larger than 3 characters, therefore it returns nil instead

# ============================================
# Question 10
# What is the return value of the following code? Why?

q10_result = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# the return array would be [1,nil,nil] as 2 and 3 will return nil due to the
# puts expression

puts "=> #{q10_result} <="