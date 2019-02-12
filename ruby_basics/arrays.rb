def qS(num)
    puts " "
    puts " "
    puts "======================"
    puts "#{num}"
    puts "======================"
end 

# New Pet
qS("New Pet")

pets = ['cat', 'dog', 'fish', 'lizard']

my_pet = pets.select {|pet| 
    pet == 'fish'
}

puts "My super awesome pet is a #{my_pet[0]}"

# More Than One
qS("More Than One")

pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets.select {|pet| pet == 'fish' || pet == 'lizard'}
# alternatively, we can do my_pets = pets[2..3]

puts "I have the greatest foo...pets ever! A #{my_pets[0]} and #{my_pets[1]}"

# Free the Lizard
qS("Free the Lizard")

my_pets.delete_at(1)

puts "My pets are now #{my_pets}"

# One isn't enough
qS("One Isn't Enough")

my_pets.push(pets[1])

puts "My new roster of pets are a #{my_pets[0]} and a #{my_pets[1]}"

# What Color Are You
qS("What Color Are You?")

colors = ['red', 'yellow', 'purple', 'green']

colors.each {|color| puts "I am the color #{color}" }


# Doubled
qS("Doubled")

numbers = [1, 2, 3, 4, 5]

doubled_numbers = numbers.map {|number| number * 2}

p doubled_numbers

# Divisible By Three
qS("Divisble By Three")

numbers = [5, 9, 21, 26, 39]
divisible_by_three = numbers.select {|number| number % 3 == 0 }

p divisible_by_three

# Favorite Number (Part 1)
qS("Favorite Number (Part 1)")

favourites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]

# Favorite Number (Part 2)
qS("Favorite Number (Part 2)")

flat_favourites = favourites.flatten

p flat_favourites

# Are We The Same?
qS("Are We The Same?")

array1 = [1, 5, 9]
array2 = [1, 9, 5]

puts array1 == array2