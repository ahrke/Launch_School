def qS(num)
    puts " "
    puts " "
    puts "======================"
    puts "#{num}"
    puts "======================"
end 

# Reading Error Messages
qS("Reading Error Messages")

puts "The error message means that the number of items we gave to the method"
puts "find_first_nonzero_among(numbers) surpass the amount it's able to take in."
puts "The method is also expecting an array."
puts "We can turn the set of numbers into an array"

# Weather Forecast
qS("Weather Forecast")

def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

puts "The reason this will always result in the same output, is because when the"
puts "if statement is checking sunshine, sunshine will always evaluate to true, as"
puts "it is a string. In order to correct this, we need to convert the values 'true'"
puts "and 'false' in the sunshine declaration to boolean values, true and false"

# Multiply By Five
qS("Multiply By Five")

def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "The result is #{multiply_by_five(number)}!"

puts "The reason for our error is that we did not convert 'number' to a Literal Number"
puts "we need to use #to_i before calling multiply_by_five"

# Pets
qS("Pets")

pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog].push('bowser')

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}

# Even Numbers
qS("Even Numbers")

numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n.even?
end

p even_numbers # expected output: [2, 6, 8]

puts "#map will iterate through the entire array, and return the work you've done"
puts "on each element. We're telling #map to return the number if it's divisible by 2"
puts "which it does exceptionally well, however we don't tell it what to do if it isn't."
puts "For the purpose of this exercise, it is best to use #select instead"

# Confucius Says
qS("Confucius Says")

def get_quote(person)
  if person == 'Yoda'
    return 'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    return 'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    return 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'

puts "The issue here is we are not returning our values correctly. The evaluation"
puts "works as expected (getting value of 'Confucius'), however after evaluating"
puts "that if statement, we will continue to the next if statement, which will be"
puts "passed over (as does not evaluate to true), then the method will finally"
puts "return nil, which the ::puts will not know how to append nil to the string."
puts "Add return statement to each if statement"

# Account Balance
qS("Account Balance")

# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts balance

puts " "
puts "What's happening here is in the months.each{}, we change balance's value"
puts "with every iteration to the exact value of the month's calculate_balance value."
puts "We are not updating 'balance' by adding/subtracting from it's previous value,"
puts "but rather changing it's value to whatever value it is currently looking at."
puts "Changing to balance += calculate_balance(month) will fix the issue"


# Colorful Things
qS("Colorful Things")

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook', 'crayon']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i > colors.length - 1

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

puts " "
puts "The loop will continue until it's completed colors.length of rounds. This is"
puts "more than the amount of elements in the colors array, therefore when we get"
puts "to the last iteration, there are no values to append to the string(s). We need"
puts "to either, change the break condition to 'i > colors.length - 1', or use colors.size"
puts "The second problem, is 'things' has less elements in it's array than 'colors', so once"
puts "we get to the last iteration (based on the number of elements in color), there is no"
puts "element that 'things' can contribute, giving us a nil when trying to build the string."
puts "We can add a new element to 'things', pop one from 'colors', or base the loop iterations"
puts "to the length - 1 of things"

# Digit Product
qS("Digit Product")

def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0

puts "We initialized product with 0, meaning that any time we try to multiply it"
puts "we will always get 0 as a result. We should initialize it with 1."

# Warriors and Wizards
qS("Warriors and Wizards")

# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  "warrior" => { strength:  20 },
  "thief" =>   { dexterity: 20 },
  "scout" =>   { stamina:   20 },
  "mage" =>    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player

puts "The input we receive from input is not a symbol, however when we're trying "
puts "to reference a class from the character_classes, we're giving it a string, which"
puts "is not the Literal type we used when defining the keys. We can change the "
puts "keys from our hash declaration to string types, rather than symbols."
puts "UPDATE: instead of changing all the keys from symbols to hash (time-consuming! hellooo!)"
puts "we can use #to_sym on the user's input instead (so input.to_sym)."
puts "After that, when we use merge, we are not mutating player permanently, so it's"
puts "stats do not stick. If we use merge!, we can destuctively mutate permanently"