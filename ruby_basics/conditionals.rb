def qS(num)
    puts " "
    puts " "
    puts "======================"
    puts "#{num}"
    puts "======================"
end 

# Unpredictable Weather (Part 1)
qS("Unpredictable Weather (Part 1)")

sun = ['visible','hidden'].sample

puts sun == 'visible' ? "The sun is so bright!" : "where is the sun?"


# Unpredictable Weather (Part 2)
qS("Unpredictable Weather (Part 2)")

puts "The clouds are blocking the sun!! Damn themmmm!" unless sun == 'visible'


# Unpredictable Weather (Part 3)
qS("Unpredictable Weather (Part 3)")

puts sun == 'hidden' ? "The darned clouds are blocking mah sun!" : "Ahh, look at that beautiful sun!"

# True or False
qS("True or False")

boolean = [true,false].sample

puts boolean ? "I'm true! I always knew I was!" : "wai....wha...I'm...not real"
boolean ? puts("I'm true") : puts("I'm false")

# Truthy Number
qS("Truthy Number")

puts "It will print 'My favourite number is 7' as number contains a truthy value,"
puts "which will be evaluated as 'true' when boolean checked"

# Stoplight (Part 1)
qS("Stoplight (Part 1)")

stoplight = ['green','yellow','red'].sample

p case stoplight
when 'green'
    "go!"
when 'yellow'
    "slow down!!"
when 'red'
    "stop!"
end 


# Stoplight (Part 2)
qS("Stoplight (Part 2)")

stoplight2 = ['green', 'yellow', 'red'].sample

if stoplight2 == 'green'
  puts 'Go!'
elsif stoplight2 == 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end


# Sleep Alert
qS("Sleep Alert")

status = ['awake','tired'].sample

sleep_alert_variable = status == 'awake' ? "go do something with your life, BOY!" : "ahh...okay, go to sleep"

p sleep_alert_variable

# Cool Numbers
qS("Cool Numbers")

number = rand(10)

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

# Stoplight (Part 3)
qS("Stoplight (Part 3)")

case stoplight
when 'green'    then    puts 'Go!'
when 'yellow'   then    puts 'Slow down!'
else                    puts 'Stop!'
end