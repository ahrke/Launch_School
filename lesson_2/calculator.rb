# ask the user for two numbers
# ask the user for the operation to perform
# perform the operation on the two numbers
# output result

def get_num()
  puts "Please enter a number: "
  gets.chomp.to_i
end 

def perform_op(op, num1, num2)
  case op
  when '+'
    return num1 + num2
  when '-'
    return num1 - num2
  when '*'
    return num1 * num2
  when '/'
    return num1 * num2
  else
    return 'error'
  end 
end 

def main()
  continue = true
  
  puts "welcome to the calculator app"
  
  while continue
    puts "1st number"
    num1 = get_num()
    
    puts "2nd number"
    num2 = get_num()
    
    puts "what operation would you like to perform? (+,-,*,/)"
    op = gets.chomp
    
    if op == 'q'
      continue = false
      break
    end 
    
    puts "the result is: "
    puts perform_op(op, num1, num2)
    
  end 
end 

main()