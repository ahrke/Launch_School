require 'pry'

WHATEVER_ONE = 21
AI_LIMIT = 17

SUITS = ["hearts","spades","clubs","diamond"]
CARD_VALUES = {
    :ace => [1,11],
    :jack => 10,
    :queen => 10,
    :king => 10,
    :one => 1,
    :two => 2,
    :three => 3,
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7,
    :eight => 8,
    :nine => 9,
    :ten => 10
  }

def basic_deck
  {
    :ace => { "suits" => SUITS},
    :jack => { "suits" => SUITS},
    :queen => { "suits" => SUITS},
    :king => { "suits" => SUITS},
    :one => { "suits" => SUITS},
    :two => { "suits" => SUITS},
    :three => { "suits" => SUITS},
    :four => { "suits" => SUITS},
    :five => { "suits" => SUITS},
    :six => { "suits" => SUITS},
    :seven => { "suits" => SUITS},
    :eight => { "suits" => SUITS},
    :nine => { "suits" => SUITS},
    :ten => { "suits" => SUITS}
  }
end

def initialize_deck
  new_deck = []
  basic_deck.each {|k,v|
    new_deck << v["suits"].map {|suit|
      "#{k} of #{suit}"
    }
  }
  
  new_deck.flatten.shuffle
end

def deal_card!(dck,hand)
  hand << dck.shift
end

def alternate_player(curr)
  curr == 'player' ? 'ai' : 'player'
end

def player_turn!(dck,hand)
  current_total = 0
  
  loop {
    current_total = total_value(hand)
    puts "Your current hand: #{hand}"
    puts "(total value = #{current_total})"
    
    if current_total > WHATEVER_ONE
      break
    end
    
    puts "hit or stay?"
    hit = gets.chomp
    
    if hit.downcase.start_with?('h')
      deal_card!(dck,hand)
    else
      break
    end
  }
  
  current_total
end

def ai_turn!(dck,hand)
  current_total = 0
  loop {
    current_total = total_value(hand)
    current_total < AI_LIMIT ?
      deal_card!(dck,hand)
      : break
  }
  current_total
end

def total_value(hand)
  sum = 0
  aces = 0
  hand.each {|card|
    this_card = card.split(' ').first
    if this_card == 'ace'
      aces += 1
      next
    end
    
    sum += CARD_VALUES[this_card.to_sym] 
  }
  
  if aces >= 1 
    aces.times {
      if sum > 10
        sum += CARD_VALUES[:ace][0]
      else
        sum += CARD_VALUES[:ace][1]
      end
    }
  end
  
  sum
end

def new_game
  player_points = 0
  ai_points = 0
  
  loop {
    puts "====== current points ======="
    puts "     you     |  computer "
    puts "      #{player_points}      |      #{ai_points}"
    puts "=============================\n\n"
    
    player_hand = []
    ai_hand = []
    current_player = 'player'  
      
    deck = initialize_deck
    
    4.times {
      current_player == 'player' ?
        deal_card!(deck,player_hand)
        : deal_card!(deck,ai_hand)
      
      current_player = alternate_player(current_player)
    }
    
    puts "the players hand is: #{player_hand}"
    puts "the computer's hand is: #{ai_hand[0]} and unknown"
    
    player_tot = player_turn!(deck,player_hand)
    ai_tot = ai_turn!(deck,ai_hand)
    
    
    puts "the players hand is: #{player_hand} for a total of: #{player_tot}"
    puts "the computer's hand is: #{ai_hand} for a total of: #{ai_tot}"
    
    if player_tot > WHATEVER_ONE
      ai_points += 1
      puts "BUST! You lose!"
    elsif ai_tot > WHATEVER_ONE
      player_points += 1
      puts "computer busts. You win!"
    elsif player_tot == WHATEVER_ONE || player_tot >= ai_tot
      player_points += 1
      puts "you win! Awesome stuff"
    else
      ai_points += 1
      puts "computer won! yay AI!"
    end
    
    binding.pry
    break if player_points == 5 || ai_points == 5
  }
  
  puts "The final winner is: #{player_points == 5 ? 'you!!!' : 'computer!!! go AI!'}"
  puts "\n\n\n"
end

loop {
  new_game
  
  puts "=============="
  puts "play again? (y or n)"
  again = gets.chomp
  
  break unless again.downcase.start_with?('y')
}