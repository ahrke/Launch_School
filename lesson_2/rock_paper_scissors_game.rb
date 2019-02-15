VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt("This is a test message")
end

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    "You won! Awesome stuff, weirdo!"
  elsif computer == player
    "It was a tie!"
  else
    "Computer won...it's okay, AI IS going to take over the world anyways"
  end
end

prompt("Welcome to our Rock, Paper, Scissors game!")

loop do
  choice = ''
  loop do
    prompt("What is your choice? (#{VALID_CHOICES.join(', ')})")
    choice = gets.chomp.downcase

    break if VALID_CHOICES.include?(choice)
    prompt("Incorrect choice, please try again...idiot")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You picked: #{choice}")
  prompt("Computer picked: #{computer_choice}")
  prompt("----------------------------")
  prompt(display_results(choice, computer_choice))
  prompt("----------------------------")

  prompt("Would you like to play again? ")
  break unless gets.chomp.downcase.start_with?('y')
end

prompt("Thanks for playing! Now go enjoy ice cream")
