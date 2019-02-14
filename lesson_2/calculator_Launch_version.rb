def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num != 0
end

num1 = 0
num2 = 0

prompt("Welcome to calculator!")

loop do
  loop do
    prompt("What is your first number?")
    num1 = Kernel.gets().chomp().to_i

    if valid_number?(num1)
      break
    else
      prompt("That's an incorrect number, idiot! Try again")
    end
  end

  loop do
    prompt("What is your second number?")
    num2 = Kernel.gets().chomp().to_i

    if valid_number?(num2)
      break
    else
      prompt("That's an incorrect number, idiot! Try again")
    end
  end

  operation_prompt = <<-MSG
    What is your desired operation?
       1) add
       2) subtract
       3) multiple
       4) divide
  MSG
  prompt(operation_prompt)
  operator = 0
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Incorrect opertion, please try again\n#{operation_prompt}")
    end
  end

  result =  case operator
            when '1'
              num1 + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_ / num2.to_i
            end

  prompt("The result is #{result}")

  prompt("Would you like to calculate again? (Y to start again)")
  again = Kernel.gets().chomp().downcase()
  break unless again.start_with?('y')
end

prompt("Thank you for using our calculator! =)")
