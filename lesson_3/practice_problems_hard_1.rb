# Question 1
if false
  greeting = “hello world”
  p greeting
end

p greeting

# this will result in nil, as nothing is being done to greeting. It is called
# after the if statement, however, the if condition is not met, so it will not
# affect greeting...however it does seem to initialize greeting
# from Launch "when you initialize a local variable within an if block, even if 
# that if block doesn’t get executed, the local variable is initialized to nil."

# Question 2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# as informal_greeting does not reference the hash 'greetings' itself, and 
# merely a value of one of it's keys, it creates a new object of String. Any
# changes to it, will not mutate the original 'greeetings' hash
# ...oh my gosh, I'm so wrong, it did alter the value of greetings[:a]. What I
# think happened is...informal_greeting is pointing to the same reference
# location as greetings[:a], and by altering the String that it points to...also
# reconfigured greetings' [:a] key to point to that location...? okay I don't knw
# So...I was kinda right. The deal is that using << will alter the original, to
# which informal_greeting is pointing to

# Question 3
# code group A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# this would print "one is: two, two is: three, three is: two"

# code group B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# this would print "one is two, two is three, three is one"

# code group C
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# this would print "one is: two, two is: three, three is: one"

# ...no Dave, wrong, wrong and right. Yes, gsub! will alter the original 
# referenced point. However, with the first two code groups, a new variable,
# albeit with same names, are created inside the method, pointing to the same
# reference point as original ones placed in, however once those are 
# reassigned, they'll point to a new object. The original variables will not
# be altered

# Question 4
def is_an_ip_number?(number)
  number.match?(/\b(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b/)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  if dot_separated_words.size != 4
    return "incorrect number of components for ip address"
  end

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop

    return false unless is_an_ip_number?(word)
  end
  return true
end

p dot_separated_ip_address?("192.168.0.1")
p dot_separated_ip_address?("192.168.244")
p dot_separated_ip_address?("192.168.0.1.10")
p dot_separated_ip_address?("192.168.0.309")
p dot_separated_ip_address?("0.68.0.1")