# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#  - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#  - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# card deck: hash
# player and comp hand: hash

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
  curr == 'player' ? 'computer' : 'player'
end

def player_turn!(dck,hand)
  current_total = 0
  
  loop {
    current_total = total_value(hand)
    puts "Your current hand: #{hand}"
    puts "(total value = #{current_total})"
    
    if current_total > 21
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

def computer_turn!(dck,hand)
  current_total = 0
  loop {
    current_total = total_value(hand)
    current_total < 17 ?
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
  loop {
    player_hand = []
    computer_hand = []
    current_player = 'player'  
      
    deck = initialize_deck
    
    4.times {
      current_player == 'player' ?
        deal_card!(deck,player_hand)
        : deal_card!(deck,computer_hand)
      
      current_player = alternate_player(current_player)
    }
    
    puts "the players hand is: #{player_hand}"
    puts "the computers hand is: #{computer_hand[0]} and unknown"
    
    player_tot = player_turn!(deck,player_hand)
    if player_tot > 21
      puts "BUST! You lose!"
      break
    end
    computer_tot = computer_turn!(deck,computer_hand)
    if computer_tot > 21
      puts "computer busts. You win!"
      break
    end
    
    
    puts "the players hand is: #{player_hand} for a total of: #{player_tot}"
    puts "the computers hand is: #{computer_hand} for a total of: #{computer_tot}"
    
    if player_tot == 21 || player_tot >= computer_tot
      puts "you win! Awesome stuff"
    else
      puts "computer won! yay AI!"
    end
    
    break
  }
end

loop {
  new_game
  
  puts "=============="
  puts "play again? (y or n)"
  again = gets.chomp
  
  break unless again.downcase.start_with?('y')
}