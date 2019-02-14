require "pry"

def prompt(message)
  puts "=> #{message}"
end

def verify_num(number)
  Float(number) rescue false
end

def comma_my_number(number)
  num_arr = number.split('')
  i = (num_arr.length - 3) / 3
  # we minus 6 to get to a point 3 digits from the end of the number, taking the 2 decimal numbers into account
  curr_comma = num_arr.length - 6
  
  binding.pry
  
  while i > 0
    num_arr.insert(curr_comma, ',')
    curr_comma -= 3
    i -= 1
    
    binding.pry
  end
  
  return num_arr.join
end

def get_value()
  value_here = ''
  loop do
    value_here = gets.chomp
    if /^\d*.?\d*$/.match?(value_here) && /\d/.match?(value_here)
      break
    else
      prompt("invalid entry, please enter a valid value")
    end
  end
  
  return value_here.to_f
end

def main()
  # p = principle amount
  p = ''
  apr = ''
  duration_years = ''
  
  prompt("welcome to our mortgage calculator!")
  
  prompt("how much is your total loan amount?")
  p = get_value()
  
  prompt("what is your Annual Percentage Rate?")
  apr = get_value()
  apr /= 100
  
  prompt("how many years is left on your mortgage?")
  duration_years = get_value()
  
  # j = monthly interest rate
  j = apr / 12
  
  # n = number of months on mortgage
  n = duration_years * 12
  
  # m = monthly payment
  m = p * (j / (1 - (1 + j)**(-n)))
  
  if m.round(2).to_s.length > 5
    m = comma_my_number(m.round(2).to_s)
  end
  
  prompt("Your monthly payment is #{m}")
end

main()