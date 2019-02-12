def qS(num)
    puts " "
    puts " "
    puts "======================"
    puts "#{num}"
    puts "======================"
end 

# Print Me (Part 1)
qS("Print Me (Part 1")

def print_me()
    p "I'm printing within the method!"
end 

print_me()

# Print Me (Part 2)
qS("Print Me (Part 2)")

def print_me2()
    return "I'm printing the return value!"
end 

puts print_me2()

# Greeting through Methods (Part 1)
qS("Greeting through methods (Part 1)")

def hello()
    return "Hello"
end 

def world()
    return "World"
end 

puts "#{hello()} #{world()}"

# Greeting through methods (Part 2)
qS("Greeting through methods (Part 2)")

def greeting()
    return "#{hello()} #{world()}"
end 

puts greeting


# make and model
qS("Make and Model")

def car(make, model)
    p "#{make} #{model}"
end 

car("Toyota","Corolla")

# day or night
qS("Day or Night")

def time_of_day(t)
    t ? "It's daytime!" : "It's nighttime!"
end

daylight = [true, false].sample
p time_of_day(daylight)

# naming animals
qS("Naming Animals")

def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."

# Name not found
qS("Name not Found")

def assign_name(name = "Bob")
    name
end 

puts assign_name('Kevin') == 'Kevin'
puts assign_name == 'Bob'

# Multiply the sum
qS("Multiply the Sum")

def add(f, s)
    f + s
end 

def multiply(f,s)
    f * s
end 

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

# Random Sentence
qS("Random Sentence")


def selectRandomElement(arr)
    arr[rand(arr.size-1)]
end 

def name(names)
    names[rand(names.size-1)]
end 

def activity(arr)
    arr[rand(arr.size-1)]
end 

def sentence(name, activity)
    name + " is " + activity + " today!"
end 

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']
puts sentence(name(names), activity(activities))

