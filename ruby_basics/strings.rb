def qS(num)
    puts " "
    puts " "
    puts "======================"
    puts "#{num}"
    puts "======================"
end 

# Create a String
qS("Create a String")

str1 = String.new("Hellow, I am a string. I don't know how else ot function")
p str1

# Quote Confusion
qS("Quote Confusion")

puts "It's now 12 o'clock"

# Ignoring Case
qS("Ignoring Case")

def matching_name(name)
    name.downcase == 'RoGeR'.downcase ? true : false
end 

puts matching_name("Roger")
puts matching_name("DAVE")

puts "easier method...puts name.casecmp('RoGeR') == 0"
puts 'Roger'.casecmp('RoGeR') == 0

# Dynamic String
qS("Dynamic String")

name_d_string = "Mathilda"
puts "Hello #{name_d_string}!!"

# Combining Names
qS("Combining Names")

first_name = 'John'
last_name = 'Doe'

full_name = first_name + ' ' + last_name

p full_name

# Tricky Formatting
qS("Tricky Formatting")

state = 'tExAs'.capitalize!

p state

# Goodbye, not Hello
qS("Goodbye, not Hello")

greeting = 'Hello!'
greeting = "Goodbye!"
puts greeting

puts "What i did was an..okay way, but there's a cool way to go about it, using"
puts "Ruby's #gsub method. It will take in two strings, and modify the first word"
puts "into the second word entered. For example:"
puts "greeting.gsub('hello','goodbye')"

greeting.gsub!("Goodbye","Wonderful")
puts greeting

# Print the Alphabet
qS("Print the Alphabet")

alphabet = 'abcdefghijklmnopqrstuvwxyz'

puts alphabet.split("")

# Pluralize
qS("Pluralize")

words = 'car human elephant airplane'

words.split(" ").each {|word|
    puts word + "s"
}

# Are you There?
qS("Are You There?")

colors = 'blue pink yellow orange'

p colors.split(" ").include?("yellow")
p colors.split(" ").include?("purple")
p colors.split(" ").include?("yell")