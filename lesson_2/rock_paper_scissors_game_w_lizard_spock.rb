require 'pry'

# Constants
VALID_CHOICES = %w(rock paper scissors lizard spock)

# Variables Initialization
players = {
  :player => 0,
  :computer => 0
}

# Method creation
def test_method
  prompt("This is a test message")
end

def prompt(message)
  puts "=> #{message}"
end

def choice?(choice)
  return 'spock' if choice.start_with?('sp')
  return 'scissors' if choice.start_with?('sc')
  
  VALID_CHOICES.each do |c|
    return c if c.start_with?(choice)
  end
end

def win?(first, second)
  (first == 'rock' && second == ('scissors' || 'lizard')) ||
    (first == 'scissors' && second == ('lizard' || 'paper')) ||
    (first == 'paper' && second == ('spock' || 'rock')) ||
    (first == 'lizard' && second == ('spock' || 'paper')) ||
    (first == 'spock' && second == ('scissors' || 'rock'))
end

def give_point(first, second, players)
  if win?(first, second)
    players[:player] += 1
  elsif first == second
    0
  else
    players[:computer] += 1
  end
  
  nil
end

def return_results(player, computer)
  if win?(player, computer)
    "You won! Awesome stuff, weirdo!"
  elsif computer == player
    "It was a tie!"
  else
    "Computer won...it's okay, AI IS going to take over the world anyways"
  end
end

def display_winner(winner)
  prompt("The GRAND WINNER IS...#{winner}!")
end

def display_current_score(players)
  prompt("Current Score")
  prompt("YOU   |   Computer")
  prompt("#{players[:player]}     |   #{players[:computer]}")
end

prompt("Welcome to our Rock, Paper, Scissors, Lizards, Spock game!")

loop do
  loop do
    choice = ''
    loop do
      prompt("What is your choice? (#{VALID_CHOICES.join(', ')})")
      choice = gets.chomp.downcase
      choice = choice?(choice)
  
      break if VALID_CHOICES.include?(choice)
      prompt("Incorrect choice, please try again...idiot")
    end
  
    computer_choice = VALID_CHOICES.sample
  
    prompt("You picked: #{choice}")
    prompt("Computer picked: #{computer_choice}")
    prompt("----------------------------")
    prompt(return_results(choice, computer_choice))
    prompt("----------------------------")
    
    give_point(choice, computer_choice, players)
    
    display_current_score(players)
    
    break if players[:player] == 5 || players[:computer] == 5
  end
  
  if players[:player] == 5
    display_winner("YOU")
  else
    display_winner("The Almighty Computer")
  end

  prompt("Would you like to play again? ")
  break unless gets.chomp.downcase.start_with?('y')
end

prompt("Thanks for playing! Now go enjoy ice cream")
