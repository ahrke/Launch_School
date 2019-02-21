# Question 1
# Given the array below
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = flintstones.each_with_object({}) { |member, hash|
  hash[member] = flintstones.index(member)
}

p flintstones_hash

# Question 2
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

age = 0
ages.each { |person| age += person[1] }

p age

# Question 3
# In the age hash:
# throw out the really old people (age 100 or older).

q3_ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

def remove_oldies(people)
  people.select {|key, value| value < 100 }
end

q3_ages = remove_oldies(q3_ages)

p q3_ages

# Question 4
# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ages.values.sort.first

p youngest

# Question 5
# In the array:
# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

first_name = flintstones.index(flintstones.select {|member| member.start_with?("Be")}[0])

p first_name

# alternatively flintstones.index { |member| member[0,2] == "Be" }

# Question 6
# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each {|member| member.slice!(3,member.length)}

p flintstones

# alternatively flintstones.map! {|member| member[0,3]}

# Question 7
# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

q7_hash = {}
statement.each_char {|c|
  q7_hash[c] == nil ? q7_hash[c] = 1 : q7_hash[c] += 1
}

p q7_hash

# Question 8
# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# modifying an array while iterating through it can cause unpredictable problems.
# this code would output "1,3", however the array will become [2,4]

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# the output would likely be..."1,2"

# Question 9
# As we have seen previously we can use some built-in string methods to change 
# the case of a string. A notably missing method is something provided in Rails,
# but not in Ruby itself...titleize. This method in Ruby on Rails creates a string
# that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"
# would be:

words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

def titleize(sentence)
  sentence.split(' ').map {|word| word.capitalize }.join(' ')
end

p titleize("the world is a wonderful place")

# =========================================
# Question 10
# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the
# family member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and
# a senior is aged 65+.
def age_group(age)
  if age <= 17
    return "kid"
  elsif age > 17 && age < 64
    return "adult"
  else
    return "senior"
  end
end

def add_age_group(hash)
  hash.each_with_object({}) {|key,hash_in|
    group = age_group(key[1]["age"])
    key[1]["age_group"] = group
    hash_in[key[0]] = key[1]
  }
end

puts add_age_group(munsters)

# alternatively
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end