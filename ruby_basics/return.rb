def qS(num)
    puts " "
    puts " "
    puts "======================"
    puts "#{num}"
    puts "======================"
end 

# Breakfast, Lunch, or Dinner? (Part 1)
qS("Breakfast, Lunch, or Dinner? (Part 1)")

puts "it will return 'Breakfast. We know this as the method meal() returns 'Breakfast"
puts "and ::puts will display what is given to it (which will be whatever the method"
puts "meal() will return"

# Breakfast, Lunch, or Dinner? (Part 2)
qS("Breakfast, Lunch, or Dinner? (Part 2)")

puts "it will print 'Evening' as it is what meal() returns"

# Breakfast, Lunch, or Dinner? (Part 3)
qS("Breakfast, Lunch, or Dinner? (Part 3)")

puts "it will return 'Breakfast' as return was explicitly used on Breakfast before"
puts "'evening' was expressed"

# Breakfast, Lunch, or Dinner? (Part 4)
qS("Breakfast, Lunch, or Dinner? (Part 4)")

puts "it will print 'Dinner' and 'Breakfast'. It is tricky, as the ::puts call will return nil"
puts "but because there is more code to follow, those will continue to be expressed"
puts "until flow has completed (in which case, the last line to be expressed will"
puts "be returned), or flow has been explicitly ended (perhaps through return or break"
puts "the puts in meal() will run as normal (printing to screen 'Evening')"

# Breakfast, Lunch, or Dinner? (Part 5)
qS("Breakfast, Lunch, or Dinner? (Part 5)")

puts "it will print nil, as the method meal() returns the value of puts '...' "
puts "...actually Dave, it will return both 'Dinner' and nil, as the ::puts inside"
puts "of meal() will print 'Dinner', and the ::p will print nil"

# Breakfast, Lunch, or Dinner? (Part 6)
qS("Breakfast, Lunch, or Dinner? (Part 6)")

puts "It will print 'Breakfast' as meal() returns that in the first line"

# Counting Sheep (Part 1)
qS("Counting Sheep (Part 1)")

puts "I think it will print '1,2,3,4,5' as those are the numbers that will be"
puts "put into the loop through every iteration"
puts "so...actually...it will return '0,1,2,3,4,5'. You were slightly correct,"
puts "however you forgot to account for index starting at 0 (yes, even for .times)"
puts "then the next thing...#.times will return the number passed in to #times (hence 5)"

# Counting Sheep (Part 2)
qS("Counting Sheep (Part 2)")

puts "this time, it will print '0,1,2,3,4,10' as we'll print from the sheep loop"
puts "however, since the #times is not the final expression, it's return value is"
puts "not returned, while the last expression '10' will be returned, which is what"
puts "::puts will print"

# Counting Sheep (Part 3)
qS("Counting Sheep (Part 3)")

puts "this time, we'll see '0,1,2, nil' as the loop will 'return' (which will exit the"
puts "method itself) after sheep > 2. The 'nil' is the returned value of the 'return' call"

# Tricky Number
qS("Tricky Number")

puts "it will print 2, as there is no indication that anything is 'true', so the"
puts "value 2 will be returned"
puts "WRONG!...so anytime an if/else statement is used, and the if is given 'true'"
puts "as it's condition, it will always evaluate. Seeing as this scenario assigns"
puts "1 to number, the expression will return the assigned value (1)"