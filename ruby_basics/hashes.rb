def qS(num)
    puts " "
    puts " "
    puts "======================"
    puts "#{num}"
    puts "======================"
end 

# First Car
qS("First Car")

car = {type: 'sedan', color: 'blue', mileage: 80_000}
p car

# Adding the Year
qS("Adding the Year")

car[:year] = 2003
p car

# Broken Odometer
qS("Broken Odometer")

car.delete(:mileage)
p car

# What Colour?
qS("What Colour?")

puts car[:color]

# Labeled Numbers
qS("Labeled Numbers")

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

p numbers.each {|k,v| "#{k} #{v}" }

# Divided By Two
qS("Divided By Two")

half_numbers = numbers.map {|k,v| v /= 2 }
p half_numbers

# Low, Medium, or High?
qS("Low, Medium, or High?")

low_numbers = numbers.select {|k,v| v < 25 }
p low_numbers

# Low or Nothing
qS("Low or Nothing")

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value|
                 value < 25
               end

p low_numbers
p numbers

# Multiple Cars
qS("Multiple Cars")

cars = {
    car: {type: 'sedan', color: 'blue', year: 2003},
    truck: {type: 'pickup', color: 'red', year: 1998}
}
p cars

# Which Collection?
qS("Which Collection?")

car = [type:  'sedan'],[color: 'blue'],[year:  2003]

p car