# Question 1
q1_indent = 0

loop do
  if q1_indent == 10
    break
  end

  indents = " " * q1_indent

  puts "#{indents}The Flinstones rock!"

  q1_indent += 1
end

# the sexy way to do it...
# 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2
# The reason (puts "the value of 40 + 2 is " + (40 + 2)) outputs an error is 
# because there is a confusion of literals. #puts will usually convert to string
# but since we have both a string and a Integer operation, we need to convert
# the Integer to string (possibly using #to_s)
# alternatively, we can also use the operation in a placeholder substition

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}"

# Question 3
def factors(number)
  divisor = number
  factors = []
  
  if number == 0 || number == nil
    return "invalid argument"
  end

  loop do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    if divisor == 0
      break
    end
  end

  factors
end

puts factors(0)
puts factors(nil)
puts factors(200)

# the purpose of the mod operation is to see if the divisor is a factor of the
# number, by checking if the operation will yield a 0 result (meaning there is 
# no remains after division)
# the purpose of 'factors' at the end of the method is to return 'factors' out

# Question 4
# the sample methods
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# rolling_buffer2(..) would be better to use, as it will not mutate, and return
# a copy of buffer upon completion. Our methods should do it's best to do one 
# thing, whether it's updating an object (mutating it), taking in something and
# returning something new from that object (without mutating anything), or 
# simply display some information without returning or mutating anything
# the first method disobeys, and performs mutation, while also returning 
# something. The second method will return a new array based on what is given

# Question 5

# the original issue stems from method declaration not being able to access
# variables created outside of itself. Therefore, the method feb(..) is using
# a variable, 'limit', that does not exist. In order for this to work, we can
# create a new parameter for the method, that takes in limit, and pass the 
# 'limit' variable as an argument 
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Question 6
def tricky_method(a_string_param, an_array_param)
  a_string_param.concat("rutabaga")
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# As tricky_method(..) uses reassignment on a_string_param, it dances on the 
# trickiness of dealing with Ruby's 'pass by reference' or 'pass by value' 
# debate, which can cause uncertainty on how our objects will be affected. 
# We want the method to mutate our string variable, and using reassignment
# will not work. So we can use #concat instead

# of course, this is the better way to go about it. Do not mutate anything
# and return a new object based on what was fed in
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 7
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# the output of this piece of code would be:
# 34
# this is the result of 42 - 8
# after checking irb...correct!

# Question 8
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
p munsters

# yes, the family's data did get ransacked. Although the hash itself didn't
# get mutated completely, the individual indexes (age, and gender) now point
# to a different value, altering the original data

# Question 9
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# the call rps("rock","paper") will return "paper", and the second will return
# "rock", giving us rps((rps("paper","rock")),"rock"), next call will give us
# rps("paper","rock"), which will finally result in "paper"
# we will get "paper" as the return

# Question 10
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)

# this will return "no", as method foo(..) returns "yes" despite what is passed
# in to it, leading to bar("yes"), which does not meet the ternary condition, 
# resulting in returning "no"