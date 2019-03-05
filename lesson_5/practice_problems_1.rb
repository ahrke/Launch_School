# Problem 1
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

puts "#{arr.map {|value| value.to_i }.sort.reverse}"

# alternatively
arr.sort do |a,b|
  b.to_i <=> a.to_i
end

# Problem 2
# How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

puts "sorted books, by year: "

sorted_books = books.sort_by {|hash|
  hash[:published]
}

puts sorted_books

# Problem 3
# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

puts "does it have a 'g'? #{arr1.flatten.include?('g')}"

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

p3_arr2 = arr2.flatten.map {|hash|
  hash.values
}
puts p3_arr2.flatten.include?('g')

arr3 = [['abc'], ['def'], {third: ['ghi']}]

p3_arr3 = arr3.map {|ele|
  ele.map {|el|
    if el.to_s.size == 3
      el
    else
      el[1]
    end
  }
}

puts p3_arr3.flatten.join.split('').include?('g')

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

puts hsh1.values.flatten.include?('g')

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p3_hsh2 = hsh2.map {|hsh|
  hsh[1].keys
}

puts p3_hsh2.flatten.include?('g')

# Problem 4
# For each of these collection objects where the value 3 occurs, demonstrate how
# you would change this to 4.

arr1 = [1, [2, 3], 4]

arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

arr2[-1] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}

hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

hsh2[['a']][:a][2] = 4
p hsh2

# Problem 5
# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

total_male_age = 0
munsters.each {|k,v|
  if v["gender"] == "male"
    total_male_age += v["age"]
  end
}

puts total_male_age

# Problem 6
# One of the most frequently used real-world string properties is that of 
# "string substitution", where we take a hard-coded string and modify it with 
# various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of 
# each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each {|k,v|
  puts "#{k.to_s} is #{v['age']} years old, and is a #{v['gender']}"
}

# Problem 7
# Given this code, what would be the final values of a and b? Try to work this 
# out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a = 4, b = [3,8]

puts a
puts b

# wrong, a = 2, b = [3,8]
# arr[0] is modifying the array, not the element. arr[1][0] is modifying the
# array

# Problem 8
# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each {|k,v|
  str = v.join
  puts str.delete('^aeiou')
}

# Problem 9
# Given this data structure, return a new array of the same structure but with 
# the sub arrays being ordered (alphabetically or numerically as appropriate) in
# descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p9_arr = arr.map {|ele|
  ele.sort {|a,b|
    b <=> a
  }
}

p p9_arr

# Problem 10
# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

q10_og_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

q10_arr = q10_og_arr.map {|sub_arr|
  sub_arr.map {|k,v|
    [k,v+1]
  }.to_h
}

p q10_arr

# alternative method: 
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

# Problem 11
# Given the following data structure use a combination of methods, including 
# either the select or reject method, to return a new array identical in
# structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p11_arr = arr.map {|ele|
  ele.select {|num|
    num % 3 == 0
  }
}

p p11_arr

# Problem 12
# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

p12_hash = {}
arr.each {|hsh|
  p12_hash[hsh[0]] = hsh[1]
}

p p12_hash

# Problem 13
# Given the following data structure, return a new array containing the same 
# sub-arrays as the original but ordered logically according to the numeric
# value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# The sorted array should look like this:
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

p13_arr = arr.sort {|a,b|
  a[2] <=> b[2]
}

p p13_arr

# the correct way (mine was wrong) is:
arr.sort_by {|sub_arr|
  sub_arr.select {|ele|
    ele.odd?
  }
}

# Problem 14
# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be 
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

p14_arr = [] 
hsh.map {|_,v|
  p14_arr << v[:colors]
  p14_arr << v[:size].upcase
}

p p14_arr

# Problem 15
# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

p15_arr = arr.map {|hsh|
  hsh.select {|_,v|
    v.all? {|num| num.even?}
  }
}

p p15_arr

# Problem 16
# A UUID is a type of identifier often used as a way to uniquely identify 
# items...which may not all be created by the same system. That is, without any 
# form of synchronization, two or more separate computer systems can create new
# items and label them with a UUID with no significant chance of stepping on
# each other's toes.

# It accomplishes this feat through massive randomization. The number of
# possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 
# 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def new_UUID
  uuid = ""
  
  sections = [8,4,4,4,12]
  
  sections.each {|num|
    num.times {|_|
      option = Random.rand(0..1)
      option == 1 ? 
        uuid << Random.rand(97..122).chr
        : uuid << Random.rand(0..9).to_s
    }
    uuid << "-"
  }
  
  uuid[0..-2]
end

p new_UUID
p new_UUID
