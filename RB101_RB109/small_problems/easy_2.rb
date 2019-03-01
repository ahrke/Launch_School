# Question 1
# Build a program that randomly generates and prints Teddy's age. To get the 
# age, you should generate a random number between 20 and 200.

def teddys_age
  puts "Teddy's age is #{rand(20..200)}"
end

teddys_age
teddys_age

# Question 2
# Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

def room_area(length, width)
  puts "The area of the room in meters is: #{length * width}"
  puts "The area of the toom in square feet is: #{(length * width) * 10.7639}"
end

room_area(40,20)
room_area(10,70)

# Question 3
# Create a simple tip calculator. The program should prompt for a bill amount 
# and a tip rate. The program must compute the tip and then display both the 
# tip and the total amount of the bill.

def tip_and_total(bill, tip)
  total_tip = bill.to_f * (tip.to_f / 100)
  puts "the tip (at #{tip}%) will be: #{total_tip.round(2)}"
  
  puts "your total bill will be: #{(bill + total_tip).round(2)}"
end

tip_and_total(20,15)
tip_and_total(1237.66,20)

# Question 4
# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

def retirement_timeline
  puts "Hey! How old are you?"
  curr_age = gets.chomp.to_i
  
  puts "At what age do you want to retire?"
  retired_age = gets.chomp.to_i
  
  current_year = Time.new.year
  
  puts "You will retire in the year #{retired_age - curr_age + current_year}"
  puts "meaning you still have to suffer for another #{retired_age - curr_age} years"
end

retirement_timeline


# Question 5
# Write a program that will ask for user's name. The program will then greet the 
# user. If the user writes "name!" then the computer yells back to the user.

puts "Hey, what's your name? "
q5_name = gets.chomp

puts q5_name[-1] == '!' ?
  "HEY #{q5_name}! WHY ARE WE SCREAMING?" :
  "hey #{q5_name}, stay awesome"
  
# Question 6
# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed 
# on separate lines.

puts "========== Question 6 ==========="
100.times {|num| puts num if num.odd? }
puts "========== Question 6 ==========="

# Question 7
# Print the even numbers from 1 to 99, inclusive. All numbers should be printed 
# on separate lines.

puts "========== Question 7 ==========="
100.times {|num| puts num if num.even? }
puts "========== Question 7 ==========="

# Question 8
# Write a program that asks the user to enter an integer greater than 0, then 
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

puts "Hey #{q5_name}, give me any number above 0: "
q8_num = gets.to_i

puts "would you like the (s)um or (p)roduct of all the values between 1 and #{q8_num}?"
q8_option = gets.chomp

def q8_sum(num)
  sum = 0
  (num + 1).times {|num| sum += num}
  sum
end

def q8_prod(num)
  prod = 1
  (1..num).each {|num| prod *= num}
  prod
end

if q8_option.downcase.start_with?('s')
  puts "The sum is #{q8_sum(q8_num)}"
elsif q8_option.downcase.start_with?('p')
  puts "The product is #{q8_prod(q8_num)}"
else
  puts "incorrect option...you fail...go home #{q5_name}, you're drunk"
end

# can make use of #upto(#) like...1.upto(num)

# Question 9
# What would print out?

# The print would be BOB, BOB, as the two variables (name and save_name) both
# reference the same object. When we call #upcase! it mutates the actual object
# being referenced, therefore both name and save_name will now be BOB

# Question 10
# What will the following code print, and why? Don't run the code until you have 
# tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# The code would print Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo
# this is because although the two arrays are separate references, different
# arrays, the elements inside of them point to the same element objects. Therefore
# mutating any element in either array will affect both array's elements

# I was right...hehe