require "yaml"

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'fr'

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num != 0
end

num1 = 0
num2 = 0

prompt(MESSAGES[LANGUAGE]['welcome'])

loop do
  loop do
    prompt(MESSAGES[LANGUAGE]['first_number'])
    num1 = Kernel.gets().chomp().to_i

    if valid_number?(num1)
      break
    else
      prompt(MESSAGES[LANGUAGE]['invalid_value'])
    end
  end

  loop do
    prompt(MESSAGES[LANGUAGE]['second_number'])
    num2 = Kernel.gets().chomp().to_i

    if valid_number?(num2)
      break
    else
      prompt(MESSAGES[LANGUAGE]['invalid_value'])
    end
  end

  prompt(MESSAGES[LANGUAGE]['operation_prompt'])
  operator = 0
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("#{MESSAGES[LANGUAGE]['invalid_op']} #{MESSAGES[LANGUAGE]['operation_prompt']}")
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
              num1.to_i / num2.to_i
            end

  prompt("#{MESSAGES[LANGUAGE]['result_is']} #{result}")

  prompt(MESSAGES[LANGUAGE]['again'])
  again = Kernel.gets().chomp().downcase()
  break unless again.start_with?('y')
end

prompt(MESSAGES[LANGUAGE]['thank_you'])
